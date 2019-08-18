#!/bin/bash

sudo bpftool map create /sys/fs/bpf/routes type lpm_trie key 6 value 1 name routes entries 512 flags 1

id=`sudo bpftool map show | grep 'name routes' | cut -f1 -d:`

echo "Map Id: $id"

sudo bpftool map id $id update key 0 0 0 0 0 0 val 0

while IFS=, read -r col1 col2 col3 
do
	echo "$col1:$col2:$col3"

	ip1=`cut -d. -f1 <<< $col1`
	ip2=`cut -d. -f2 <<< $col1`
	ip3=`cut -d. -f3 <<< $col1`
	ip4=`cut -d. -f4 <<< $col1`

	sudo bpftool map id $id update key $col2 0 $ip4 $ip3 $ip2 $ip1 val $col3

done < ../data/routes_processed.csv
