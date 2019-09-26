/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
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
    int key = 0;
    int *val;
    // ctx->ingress_ifindex;
    val = bpf_map_lookup_elem(&counter, &key);
    if(val){
        (*val)++;
    }

	// 2: enp2s0 : reverse
	// 4: enp0s31f6 : forward
	// return bpf_redirect_map(&tx_port, 4, 0);
	return XDP_TX;
}

char _license[] SEC("license") = "GPL";
