#!/bin/bash

# Initialize tx_port for packet redirection
if [ "$#" -eq "0" ]
    then
        echo " USAGE:"
        echo "./init.sh <ifname>"
else
    sudo bpftool map update pinned /sys/fs/bpf/$1/tx_port key 1 0 0 0 val 1 0 0 0
    sudo bpftool map update pinned /sys/fs/bpf/$1/tx_port key 2 0 0 0 val 2 0 0 0
    sudo bpftool map update pinned /sys/fs/bpf/$1/tx_port key 3 0 0 0 val 3 0 0 0
    sudo bpftool map update pinned /sys/fs/bpf/$1/tx_port key 4 0 0 0 val 4 0 0 0

    sudo bpftool map dump pinned /sys/fs/bpf/$1/tx_port
fi
