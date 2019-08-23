#!/bin/bash

for i in `seq 1 10`; do
	iperf -c 192.168.1.1 -u -l 22 -t 10 -b 1000M >> iperf-client.txt
	sleep 11
done
