#!/bin/bash
#Script to start container based on template
echo "Number of systems to create : "$1
for i in $(seq 1 $1)
do
	attackerVMId=$((110+$i))
	pct clone 998 $attackerVMId --hostname pirate-$attackerVMId --full 1
	pentesterVMId=$((210+$i))
	pct clone 999 $pentesterVMId --hostname pentester-$pentesterVMId --full 1

done
echo "Clones créés"
