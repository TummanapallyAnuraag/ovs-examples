/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include "bpf_helpers.h"
#include "bpf_endian.h"
#include "common_kern_user.h" /* defines: struct datarec; */
#include "../includes/common/parsing_helpers.h"
#include "../includes/common/rewrite_helpers.h"

struct bpf_map_def SEC("maps") counter = {
	.type        = BPF_MAP_TYPE_ARRAY,
	.key_size    = sizeof(int),
	.value_size  = sizeof(int),
	// .map_flags   = BPF_F_NO_PREALLOC,
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
    return XDP_DROP;
}

char _license[] SEC("license") = "GPL";
