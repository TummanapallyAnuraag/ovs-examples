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

SEC("classifier")
int cls_main(struct __sk_buff *skb)
{
	return -1;
}

SEC("action")
int pingpong(struct __sk_buff *skb)
{
	/* We will access all data through pointers to structs */
	void *data = (void *)(long)skb->data;
	void *data_end = (void *)(long)skb->data_end;
	// unsigned char bytes[4];


	if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct icmphdr) > data_end)
		return TC_ACT_UNSPEC;

	/* for easy access we re-use the Kernel's struct definitions */
	struct ethhdr  *eth  = data;
	struct iphdr   *ip   = (data + sizeof(struct ethhdr));

	/* Only actual IP packets are allowed */
	if (eth->h_proto != __constant_htons(ETH_P_IP))
		return TC_ACT_UNSPEC;

    trace_printk("packet\n");

    /* Send a clone copy on lo */
    bpf_clone_redirect(skb, 1, 0);

	/* We modified the packet and redirected it, it can be dropped here */
	return TC_ACT_SHOT;
}

char __license[] SEC("license") = "GPL";
