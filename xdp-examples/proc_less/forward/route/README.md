# SEQUENCE OF OPERATIONS

> For interface `enp2s0`

1. To Attach BPF to `enp2s0` run - `sudo ./xdp_loader -d enp2s0 -S`

2. To Initialize `tx_port` MAP run - `./init.sh enp2s0`

> All BPF MAPS are mapped as filed at `/sys/fs/bpf/`
> For current BPF Implementation, have a look at `/sys/fs/bpf/enp2s0/`

3. To view debug log run - `sudo cat /sys/kernel/debug/tracing/trace_pipe`

4. To Detach BPF from `enp2s0` run - `sudo ./xdp_loader -d enp2s0 -SU`

# USEFUL COMMANDS

```
sudo cat /sys/kernel/debug/tracing/trace_pipe
```

```

/*DEFINITION*/
#define bpf_printk(fmt, ...)                                    \
({                                                              \
	char ____fmt[] = fmt;                                   \
	bpf_trace_printk(____fmt, sizeof(____fmt),              \
                         ##__VA_ARGS__);                        \
})


/*USAGE*/
bpf_printk("IPv4\n");
```


# NOTEWORTHY HELPER FUNCTIONS

* `bpf_ntohs`


# MISCELLANEOUS

* IP Header Format - <https://en.wikipedia.org/wiki/IPv4#Header>
