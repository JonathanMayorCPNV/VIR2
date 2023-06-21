#!/bin/bash
#Script to start container based on template
echo "Number of systems to stop : "$1
for i in $(seq 1 $1)
do
	attackerVMId=$((110+$i))
	pct stop $attackerVMId
	pentesterVMId=$((210+$i))
	pct stop $pentesterVMId
done
