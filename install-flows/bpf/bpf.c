#include <linux/bpf.h>
#include <linux/pkt_cls.h>
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/icmp.h>
#include <linux/in.h>
#include <stddef.h>

#include "bpf_helpers.h"

// BPF_PERF_OUTPUT is more elegant
#define trace_printk(fmt, ...) do { \
	char _fmt[] = fmt; \
	bpf_trace_printk(_fmt, sizeof(_fmt), ##__VA_ARGS__); \
	} while (0)

/* compiler workaround */
#define bpf_htonl __builtin_bswap32
#define bpf_memcpy __builtin_memcpy

#define BPF_MAX_MARK    512
#define PIN_NONE        0
#define PIN_OBJECT_NS   1
#define PIN_GLOBAL_NS   2
#define BPF_ANY         0

/*
For Reference purposes:
struct bpf_lpm_trie_key {
    __u32	prefixlen;	// up to 32 for AF_INET, 128 for AF_INET6
    __u8	data[0];	// Arbitrary size
};
*/

struct lpm_v4_key {
    struct bpf_lpm_trie_key lpm;
    __u8 addr[4];
};
struct lpm_val {
	__u8 flags;
};

struct bpf_elf_map SEC("maps") routes = {
	.type		= BPF_MAP_TYPE_LPM_TRIE,
	.size_key	= sizeof(struct lpm_v4_key),
	.size_value	= sizeof(struct lpm_val),
	.flags		= BPF_F_NO_PREALLOC,
	.pinning	= PIN_GLOBAL_NS,
	.max_elem	= BPF_MAX_MARK,
};

SEC("classifier")
int cls_main(struct __sk_buff *skb){
	return -1;
}

SEC("action")
int pingpong(struct __sk_buff *skb){
    /* We will access all data through pointers to structs */
    void *data = (void *)(long)skb->data;
    void *data_end = (void *)(long)skb->data_end;

    if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct icmphdr) > data_end)
    	return TC_ACT_UNSPEC;

    /* for easy access we re-use the Kernel's struct definitions */
    struct ethhdr  *eth  = data;
    struct iphdr   *ip   = (data + sizeof(struct ethhdr));

    /* Only actual IP packets are allowed */
    if (eth->h_proto != __constant_htons(ETH_P_IP))
    	return TC_ACT_UNSPEC;

    // __u32 src_ip = ip->saddr;
	__u32 dst_ip = ip->daddr;
    struct lpm_v4_key key;
    struct lpm_val *val;

    trace_printk("packet received ..\n");
    key.lpm.prefixlen = 32;
    key.addr[0] = dst_ip & 0xFF;
    key.addr[1] = (dst_ip >> 8) & 0xFF;
    key.addr[2] = (dst_ip >> 16) & 0xFF;
    key.addr[3] = (dst_ip >> 24) & 0xFF;

    trace_printk("ip[0]: %d\n", key.addr[0]);
    trace_printk("ip[1]: %d\n", key.addr[1]);
    trace_printk("ip[2]: %d\n", key.addr[2]);
    trace_printk("ip[3]: %d\n", key.addr[3]);
    // search the LPM_TRIE
    val = bpf_map_lookup_elem(&routes, &key);
    if(val){
        trace_printk("TRIE hit!, output=%d\n", val->flags);
    }

    /* We modified the packet and redirected it, it can be dropped here */
    return TC_ACT_SHOT;
}

char __license[] SEC("license") = "GPL";
