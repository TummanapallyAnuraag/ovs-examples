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

SEC("xdp_pass")
int  xdp_pass_func(struct xdp_md *ctx)
{
    int key = 0;
    int *val;
    for(int temp=15; temp>=0; temp--){
	int waste = temp;
	waste++;waste *= 1;waste /= 1;waste--;
	waste++;waste *= 1;waste /= 1;waste--;
	waste++;waste *= 1;waste /= 1;waste--;
	waste++;waste *= 1;waste /= 1;waste--;
	bpf_printk("\t%d\n", waste);
	val = bpf_map_lookup_elem(&counter, &key);
    }

    val = bpf_map_lookup_elem(&counter, &key);
    if(val){
        (*val)++;
    }

    return XDP_DROP;
}

char _license[] SEC("license") = "GPL";
