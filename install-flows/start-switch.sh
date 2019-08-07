#!/bin/bash

sudo ovs-vsctl add-br sw0
sudo ovs-vsctl add-port sw0 enp2s0
sudo ovs-vsctl add-port sw0 enp2s1
sudo ovs-vsctl set-fail-mode sw0 standalone
sudo ovs-vsctl set-controller sw0 tcp:127.0.0.1:6633
