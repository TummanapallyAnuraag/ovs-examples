## `install-flows`

**Aim:** To install flow entries using POX Controller in OpenVSwitch

This folder contains shell script to start a switch (`sw0`)

The controller module for this is in `pox/ext/install-flows.py`, which uses `pox/routes.csv` to populate
Flow entries in the Switch

>Sample of `pox/routes.csv`:
```
170.80.152.0/22,2
170.80.152.0/22,2
186.227.0.0/20,2
186.227.0.0/20,2
```
