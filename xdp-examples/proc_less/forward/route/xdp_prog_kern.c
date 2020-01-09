/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <arpa/inet.h>
#include "bpf_helpers.h"
#include "bpf_endian.h"
#include "common_kern_user.h" /* defines: struct datarec; */
#include "../includes/common/parsing_helpers.h"
#include "../includes/common/rewrite_helpers.h"

#define bpf_printk(fmt, ...)                                    \
({                                                              \
	char ____fmt[] = fmt;                                   \
	bpf_trace_printk(____fmt, sizeof(____fmt),              \
                         ##__VA_ARGS__);                        \
})

struct bpf_map_def SEC("maps") counter = {
	.type        = BPF_MAP_TYPE_ARRAY,
	.key_size    = sizeof(int),
	.value_size  = sizeof(int),
	// .map_flags   = BPF_F_NO_PREALLOC,
	.max_entries = 10,
};

struct bpf_map_def SEC("maps") tx_port = {
	.type = BPF_MAP_TYPE_DEVMAP,
	.key_size = sizeof(int),
	.value_size = sizeof(int),
	.max_entries = 10,
};

SEC("xdp_pass")
int  xdp_pass_func(struct xdp_md *ctx)
{
	void *data = (void *)(long)ctx->data;
	void *data_end = (void *)(long)ctx->data_end;
	struct ethhdr *eth = data;
	struct iphdr *iph = NULL;
	__u16 eth_type;
	__u64 offset = sizeof(*eth);

	if ((void *)eth + offset > data_end)
		return 0;

	eth_type = eth->h_proto;

	if (eth_type == bpf_ntohs(0x0800)) {
		bpf_printk("IPv4\n");
		iph = (struct iphdr*)(data + sizeof(struct ethhdr));
		if ((void *)iph + sizeof(*iph) > data_end)
			return 0;
		if(iph->ttl == 0)
			return XDP_DROP;
		iph->ttl--;
    }

    int key = 0;
    int *val;
    // ctx->ingress_ifindex;
    val = bpf_map_lookup_elem(&counter, &key);
    if(val){
        (*val)++;
    }

	// 2: enp2s0
	// 3: enp2s1
	// 4: enp0s31f6
	// send all packets to enp2s1
	// MAC of enp0s31f6 - e0 : d5 : 5e : 46 : 58 : 88
	__u8 dst[6], src[6];
	src[0] = 0xe0; dst[0] = 0x0c;
	src[1] = 0xd5; dst[1] = 0x54;
	src[2] = 0x5e; dst[2] = 0xa5;
	src[3] = 0x46; dst[3] = 0x16;
	src[4] = 0x58; dst[4] = 0xcf;
	src[5] = 0x88; dst[5] = 0x27;

	__builtin_memcpy(eth->h_source, src, ETH_ALEN);
	__builtin_memcpy(eth->h_dest, dst, ETH_ALEN);

	return bpf_redirect_map(&tx_port, 3, 0);
}

char _license[] SEC("license") = "GPL";
