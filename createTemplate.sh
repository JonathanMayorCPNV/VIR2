#!/bin/bash
pct destroy 998 --force
pct destroy 999 --force

#Script to create templates
pct create 998 local:vztmpl/debian-11-standard_11.6-1_amd64.tar.zst --storage local-lvm --rootfs=2 --description "Template for pirate container" --hostname PirateTemplateCont --password 'Pa$$w0rd' --net0 name=eth0,bridge=vmbr0,ip=dhcp --force --start 
pct create 999 local:vztmpl/debian-11-standard_11.6-1_amd64.tar.zst --storage local-lvm --rootfs=2 --description "Template for Pentester container" --hostname PentesterTemplateCont --password 'Pa$$w0rd' --net0 name=eth0,bridge=vmbr0,ip=dhcp --features keyctl=1,nesting=1,fuse=1 --force --start 

#Sleep waiting containers creation
sleep 10

#Push the configuration files
pct push 998 ./installationPirate.sh /root/installationPirate.sh
pct push 999 ./installationPentester.sh /root/installationPentester.sh

#Run the configuration files
pct exec 998 bash /root/installationPirate.sh
pct exec 999 bash /root/installationPentester.sh

#Sleep waiting containers creation
sleep 5

#Shutdown the newly created containers
pct shutdown 998
pct shutdown 999

#Sleep waiting containers creation
sleep 10

#Create templates from the containers
pct template 998
pct template 999

echo "Templates céés "
