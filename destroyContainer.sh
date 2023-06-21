#!/bin/bash
#Script to start container based on template
echo "Number of systems to destroy : "$1
for i in $(seq 1 $1)
do
	attackerVMId=$((110+$i))
	pct destroy $attackerVMId --force
	pentesterVMId=$((210+$i))
	pct destroy $pentesterVMId --force
done
pct destroy 998
pct destroy 999
