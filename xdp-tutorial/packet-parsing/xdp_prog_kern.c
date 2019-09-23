/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include "bpf_helpers.h"
#include "bpf_endian.h"
#include "common_kern_user.h" /* defines: struct datarec; */
#include "../common/parsing_helpers.h"
#include "../common/rewrite_helpers.h"

struct lpm_v4_key {
    struct bpf_lpm_trie_key lpm;
    __u8 addr[4];
};
struct lpm_val {
	__u8 flags;
};

#define bpf_printk(fmt, ...)                                    \
({                                                              \
	char ____fmt[] = fmt;                                   \
	bpf_trace_printk(____fmt, sizeof(____fmt),              \
                         ##__VA_ARGS__);                        \
})

struct bpf_map_def SEC("maps") routes = {
	.type        = BPF_MAP_TYPE_LPM_TRIE,
	.key_size    = sizeof(struct lpm_v4_key),
	.value_size  = sizeof(struct lpm_val),
	.map_flags   = BPF_F_NO_PREALLOC,
	.max_entries = 512,
};

/* LLVM maps __sync_fetch_and_add() as a built-in function to the BPF atomic add
 * instruction (that is BPF_STX | BPF_XADD | BPF_W for word sizes)
 */
#ifndef lock_xadd
#define lock_xadd(ptr, val)	((void) __sync_fetch_and_add(ptr, val))
#endif
/*
static inline __u64 ether_addr_to_u64(const __u8 *addr)
{
	__u64 u = 0;
	int i;

	for (i = ETH_ALEN; i >= 0; i--)
		u = u << 8 | addr[i];
	return u;
}
*/
static inline void ip_format(__u8 * ip_addr, const __be32 addr)
{
    __u32 u = bpf_ntohl(addr);
    ip_addr[3-0] = (__u8)(u & 0xFF);
    ip_addr[3-1] = (__u8)(u >> 8 & 0xFF);
    ip_addr[3-2] = (__u8)(u >> 16 & 0xFF);
    ip_addr[3-3] = (__u8)(u >> 24 & 0xFF);
	return;
}

SEC("xdp_pass")
int  xdp_pass_func(struct xdp_md *ctx)
{
    void *data = (void *)(long)ctx->data;
	void *data_end = (void *)(long)ctx->data_end;
	struct ethhdr *eth = data;
	__u64 offset = sizeof(*eth);

	if ((void *)eth + offset > data_end)
		return 0;

    struct iphdr *ip = (void *)eth + offset;
    offset = sizeof(*ip);

    if ((void *)ip + offset > data_end)
		return 0;

    __u8 ip_addr[4];
    ip_format(ip_addr, ip->saddr);
    bpf_printk("%d.%d\n",ip_addr[0], ip_addr[1]);
    bpf_printk("\t%d.%d\n",ip_addr[2], ip_addr[3]);

    ip_format(ip_addr, ip->daddr);
    bpf_printk("\t\t->%d.%d\n",ip_addr[0], ip_addr[1]);
    bpf_printk("\t\t\t%d.%d\n",ip_addr[2], ip_addr[3]);

	return XDP_PASS;
}

char _license[] SEC("license") = "GPL";
