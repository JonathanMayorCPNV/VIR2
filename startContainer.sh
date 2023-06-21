#!/bin/bash
#Script to start container based on template
echo "Number of systems to start : "$1
for i in $(seq 1 $1)
do
	attackerVMId=$((110+$i))
	pct start $attackerVMId
	pentesterVMId=$((210+$i))
	pct start $pentesterVMId
done
for i in $(seq 1 $1)
do
	attackerVMId=$((110+$i))
	echo "Voici l'adresse de la machine pirate-"$attackerVMId
	pct exec $attackerVMId ip a s dev eth0 | sed -n '/inet / s/\// /p' | awk '{print $2}'
	pentesterVMId=$((210+$i))
	echo "Voici l'adresse de la machine pentester-"$pentesterVMId
	pct exec $pentesterVMId ip a s dev eth0 | sed -n '/inet / s/\// /p' | awk '{print $2}'
done
