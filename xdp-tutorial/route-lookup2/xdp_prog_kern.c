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

struct bpf_map_def SEC("maps") tx_port = {
	.type = BPF_MAP_TYPE_DEVMAP,
	.key_size = sizeof(int),
	.value_size = sizeof(int),
	.max_entries = 10,
};

struct bpf_map_def SEC("maps") mac_src = {
    .type = BPF_MAP_TYPE_ARRAY,
    .key_size = sizeof(int),
    .value_size = 6*sizeof(__u8),
    .max_entries = 10,
};

struct bpf_map_def SEC("maps") mac_dst = {
    .type = BPF_MAP_TYPE_ARRAY,
    .key_size = sizeof(int),
    .value_size = 6*sizeof(__u8),
    .max_entries = 10,
};

SEC("xdp_pass")
int  xdp_pass_func(struct xdp_md *ctx)
{
    void *data = (void *)(long)ctx->data;
	void *data_end = (void *)(long)ctx->data_end;
	struct ethhdr *eth = data;
    struct hdr_cursor nh;
    int type;
	__u64 offset = sizeof(*eth);

	if ((void *)eth + offset > data_end)
		return 0;

    nh.pos = data;
    type = parse_ethhdr(&nh, data_end, &eth);
    if(type == ETH_P_IP){
        struct iphdr *ip = (void *)eth + offset;
        offset = sizeof(*ip);

        if ((void *)ip + offset > data_end)
    		return 0;

        struct lpm_v4_key lookup_key;
        struct lpm_val *interface;
        lookup_key.lpm.prefixlen = 32;

        lookup_key.addr[0] = (__u8)(ip->daddr       & 0xFF);
        lookup_key.addr[1] = (__u8)(ip->daddr >>  8 & 0xFF);
        lookup_key.addr[2] = (__u8)(ip->daddr >> 16 & 0xFF);
        lookup_key.addr[3] = (__u8)(ip->daddr >> 24 & 0xFF);


        // bpf_printk("->%d.%d\n",lookup_key.addr[0], lookup_key.addr[1]);
        // bpf_printk("\t%d.%d\n",lookup_key.addr[2], lookup_key.addr[3]);

        interface = bpf_map_lookup_elem(&routes, &lookup_key);
        interface = bpf_map_lookup_elem(&routes, &lookup_key);
        if(interface){
            // bpf_printk("Trie hit!, output iface = %d\n", interface->flags);
            if(interface->flags){
                // modify mac headers
                __u8 *src, *dst;
                int iface = interface->flags;
                src = bpf_map_lookup_elem(&mac_src, &iface);
                dst = bpf_map_lookup_elem(&mac_dst, &iface);
                if(src && dst){
                    __builtin_memcpy(eth->h_source, src, ETH_ALEN);
                    __builtin_memcpy(eth->h_source, src, ETH_ALEN);
                    __builtin_memcpy(eth->h_source, src, ETH_ALEN);
                    __builtin_memcpy(eth->h_dest, dst, ETH_ALEN);
                    __builtin_memcpy(eth->h_dest, dst, ETH_ALEN);
                    __builtin_memcpy(eth->h_dest, dst, ETH_ALEN);
                    // bpf_printk("src[0:]: %x:%x:..\n", src[0], src[1]);
                    // bpf_printk("dst[0:]: %x:%x:..\n", dst[0], dst[1]);
                }
                return bpf_redirect_map(&tx_port, interface->flags, 0);
            }
        }
    }

	return XDP_PASS;
}

char _license[] SEC("license") = "GPL";
