#################################################################################
#                                                                               #
# Author: Anuraag Tummanapally                                                  #
# Description: To display the "counter" map pinned at /sys/fs/bpf/xdp/counter   #
#                                                                               #
#################################################################################

#!/bin/bash

display_counter(){

	# MSB through LSB (Ubuntu 18 - my machine - check the endianness!)
	h1=$(echo $1 | cut -d: -f3 | cut -d' ' -f5)
	h2=$(echo $1 | cut -d: -f3 | cut -d' ' -f4)
	h3=$(echo $1 | cut -d: -f3 | cut -d' ' -f3)
	h4=$(echo $1 | cut -d: -f3 | cut -d' ' -f2)

	hnum=$(echo "$h1 $h2 $h3 $h4" | sed 's/\ //g')
	# echo "Base 16: "$hnum
	# echo "Base 10: "$(( 16#$hnum ))

	echo "$2 | pkt count: "$(( 16#$hnum ))
	echo ""

}

display_interrupt() {
	# $1 - current interrupts, $2 - prev interrupts, $3 - iface name

	d1=$(( $(echo $1 | cut -d' ' -f2) - $(echo $2 | cut -d' ' -f2) ))
	#d2=$(( $(echo $1 | cut -d' ' -f3) - $(echo $2 | cut -d' ' -f3) ))
	#d3=$(( $(echo $1 | cut -d' ' -f4) - $(echo $2 | cut -d' ' -f4) ))
	#d4=$(( $(echo $1 | cut -d' ' -f5) - $(echo $2 | cut -d' ' -f5) ))
	#d5=$(( $(echo $1 | cut -d' ' -f6) - $(echo $2 | cut -d' ' -f6) ))
	#d6=$(( $(echo $1 | cut -d' ' -f7) - $(echo $2 | cut -d' ' -f7) ))
	#d7=$(( $(echo $1 | cut -d' ' -f8) - $(echo $2 | cut -d' ' -f8) ))
	#d8=$(( $(echo $1 | cut -d' ' -f9) - $(echo $2 | cut -d' ' -f9) ))

	echo $3": "
	#echo $(( $d1 + $d2 + $d3 + $d4 + $d5 + $d6 + $d7 + $d8 ))
	echo $(( $d1 ))
	echo ""
}



#--------------------------------------------------------------------------------------#

if [[ "$1" == "-r" ]]; then
	echo "resetting the counters!"
	sudo bpftool map update pinned /sys/fs/bpf/enp2s0/counter key 0 0 0 0 val 0 0 0 0
	sudo bpftool map update pinned /sys/fs/bpf/enp2s1/counter key 0 0 0 0 val 0 0 0 0
	sudo bpftool map update pinned /sys/fs/bpf/enp0s31f6/counter key 0 0 0 0 val 0 0 0 0
	exit
fi
clear
prev_inter_0=$(cat /proc/interrupts | grep enp2s0)
prev_inter_1=$(cat /proc/interrupts | grep enp2s1)
prev_inter_3=$(cat /proc/interrupts | grep enp0s31f6)

echo "----------------"
date +%r
echo "CPU Utilization:"
echo "----------------"
sar -u 1 15



echo "----------------"
date +%r
echo "Counters:"
echo "----------------"
x=$(sudo bpftool map lookup pinned /sys/fs/bpf/enp2s0/counter key 0 0 0 0)
display_counter "$x" "enp2s0"

x=$(sudo bpftool map lookup pinned /sys/fs/bpf/enp2s1/counter key 0 0 0 0)
display_counter "$x" "enp2s1"

x=$(sudo bpftool map lookup pinned /sys/fs/bpf/enp0s31f6/counter key 0 0 0 0)
display_counter "$x" "enp0s31f6"




echo "-----------"
date +%r
echo "Interrupts:"
echo "-----------"
cur_inter_0=$(cat /proc/interrupts | grep enp2s0)
cur_inter_1=$(cat /proc/interrupts | grep enp2s1)
cur_inter_3=$(cat /proc/interrupts | grep enp0s31f6)

display_interrupt "$cur_inter_0" "$prev_inter_0" "enp2s0"
display_interrupt "$cur_inter_1" "$prev_inter_1" "enp2s1"
display_interrupt "$cur_inter_3" "$prev_inter_3" "enp0s31f6"




echo "resetting the counters!"
sudo bpftool map update pinned /sys/fs/bpf/enp2s0/counter key 0 0 0 0 val 0 0 0 0
sudo bpftool map update pinned /sys/fs/bpf/enp2s1/counter key 0 0 0 0 val 0 0 0 0
sudo bpftool map update pinned /sys/fs/bpf/enp0s31f6/counter key 0 0 0 0 val 0 0 0 0
