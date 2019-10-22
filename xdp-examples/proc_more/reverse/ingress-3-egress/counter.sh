#################################################################################
#                                                                               #
# Author: Anuraag Tummanapally                                                  #
# Description: To display the "counter" map pinned at /sys/fs/bpf/xdp/counter   #
#                                                                               #
#################################################################################

#!/bin/bash
if [[ "$1" == "-r" ]]; then
	echo "resetting the counter!"
	sudo bpftool map update pinned /sys/fs/bpf/xdp/counter key 0 0 0 0 val 0 0 0 0
	exit
fi
clear
date +%r
prev_inter=$(cat /proc/interrupts | grep enp2s0)
echo "CPU Utilization:"
echo "----------------"
sar -u 1 15

x=$(sudo bpftool map lookup pinned /sys/fs/bpf/xdp/counter key 0 0 0 0)

# MSB through LSB (Ubuntu 18 - my machine - check the endianness!)
h1=$(echo $x | cut -d: -f3 | cut -d' ' -f5)
h2=$(echo $x | cut -d: -f3 | cut -d' ' -f4)
h3=$(echo $x | cut -d: -f3 | cut -d' ' -f3)
h4=$(echo $x | cut -d: -f3 | cut -d' ' -f2)

hnum=$(echo "$h1 $h2 $h3 $h4" | sed 's/\ //g')
# echo "Base 16: "$hnum
# echo "Base 10: "$(( 16#$hnum ))

echo ""
echo "pkt count: "$(( 16#$hnum ))
echo ""

date +%r
echo ""
echo "Interrupts:"
echo "-----------"
cur_inter=$(cat /proc/interrupts | grep enp2s0)
echo $prev_inter
echo $cur_inter
d1=$(( $(echo $cur_inter | cut -d' ' -f2) - $(echo $prev_inter | cut -d' ' -f2) ))
d2=$(( $(echo $cur_inter | cut -d' ' -f3) - $(echo $prev_inter | cut -d' ' -f3) ))
d3=$(( $(echo $cur_inter | cut -d' ' -f4) - $(echo $prev_inter | cut -d' ' -f4) ))
d4=$(( $(echo $cur_inter | cut -d' ' -f5) - $(echo $prev_inter | cut -d' ' -f5) ))
d5=$(( $(echo $cur_inter | cut -d' ' -f6) - $(echo $prev_inter | cut -d' ' -f6) ))
d6=$(( $(echo $cur_inter | cut -d' ' -f7) - $(echo $prev_inter | cut -d' ' -f7) ))
d7=$(( $(echo $cur_inter | cut -d' ' -f8) - $(echo $prev_inter | cut -d' ' -f8) ))
d8=$(( $(echo $cur_inter | cut -d' ' -f9) - $(echo $prev_inter | cut -d' ' -f9) ))

echo ""
echo "Count Difference:"
echo "-----------------"
echo $(( $d1 + $d2 + $d3 + $d4 + $d5 + $d6 + $d7 + $d8 ))

echo ""
echo "resetting the counter!"
sudo bpftool map update pinned /sys/fs/bpf/xdp/counter key 0 0 0 0 val 0 0 0 0
