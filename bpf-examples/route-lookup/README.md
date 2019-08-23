## About

This experiment, will redirect packets based on the destination IP Address, and the corresponding output interface in the map pinned to `/sys/fs/bpf/tc/global/routes`

Have a look at this function:
```
bpf_clone_redirect(skb, interface_no,0);
```
