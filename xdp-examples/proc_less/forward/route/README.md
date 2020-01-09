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
