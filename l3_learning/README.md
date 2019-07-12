# L3 Learning

## Description
Implementation of L3 Switch using `OVS`(open vswitch) with `POX` as controller.

## Setup

![](img/topology.png)

* `ip link` on OVS result:

![](img/MAC_addresses.png)

* OVS setup commands:

![](img/ovs-vsctl.png)

* OVS:

![](img/ovs-vsctl_show.png)

* POX controller:

![](img/pox-l3.png)

## Requirements

- `POX` controller <https://github.com/noxrepo/pox>

- `openvswitch-switch`, `openvswitch-common`, `openvswitch-doc`

## References

- <https://remote-lab.net/sdn-intro-basic-with-ovs-and-pox>

- <https://noxrepo.github.io/pox-doc/html/#forwarding-l3-learning>
