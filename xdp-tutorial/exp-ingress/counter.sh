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
fi

x=$(sudo bpftool map lookup pinned /sys/fs/bpf/xdp/counter key 0 0 0 0)

echo $(date)
echo $x

# MSB through LSB (Ubuntu 18 - my machine - check the endianness!)
h1=$(echo $x | cut -d: -f3 | cut -d' ' -f5)
h2=$(echo $x | cut -d: -f3 | cut -d' ' -f4)
h3=$(echo $x | cut -d: -f3 | cut -d' ' -f3)
h4=$(echo $x | cut -d: -f3 | cut -d' ' -f2)

hnum=$(echo "$h1 $h2 $h3 $h4" | sed 's/\ //g')
echo "Base 16: "$hnum
echo "Base 10: "$(( 16#$hnum ))
