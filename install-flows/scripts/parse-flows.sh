#!/bin/bash

sudo ovs-ofctl dump-flows sw0 > ../data/flowdump
grep -o 'nw_dst.*' ../data/flowdump | sed 's/nw_dst=//g' | sed 's/ actions=output:/,/g' > ../data/routes.csv

echo "Sample of ../data/routes.csv, looks like this:"
tail -n5 ../data/routes.csv
