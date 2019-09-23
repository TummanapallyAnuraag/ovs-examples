#!/bin/bash

x=$(sudo bpftool map lookup pinned /sys/fs/bpf/xdp/counter key 0 0 0 0)

echo $x

# MSB through LSB
h1=$(echo $x | cut -d: -f3 | cut -d' ' -f5)
h2=$(echo $x | cut -d: -f3 | cut -d' ' -f4)
h3=$(echo $x | cut -d: -f3 | cut -d' ' -f3)
h4=$(echo $x | cut -d: -f3 | cut -d' ' -f2)

echo $h1 $h2 $h3 $h4
