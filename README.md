## Install flows

**Aim:** To install flow entries using POX Controller in OpenVSwitch

This folder contains shell script to start a switch (`sw0`)

The controller module for this is in `pox/ext/install-flows.py`, which uses `pox/routes.csv` to populate
flow entries in the Switch

>Sample of `pox/routes.csv`:

```
170.80.152.0/22,2
170.80.152.0/22,2
186.227.0.0/20,2
186.227.0.0/20,2
```

## DIR: `[bpf-examples](bpf-examples)`

* `map-pinning` : Example of pinning a map from `tc` eBPF code, and accessing the key value pair(s)

* `ingress-egress` : Example of redirecting a packet from one interface (Eg. `eno1`) to other (Eg. `wlo1`)

* `route-lookup` : Example of a `LPM_TRIE` map for IP lookup for egress interface, and send out of that interface.
