#!/bin/bash
#Script to install Pirate requirements
apt update -y 
apt upgrade -y
apt-get install nmap netdiscover patator crunch lynx weevely sqlmap nano sudo -y

sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
