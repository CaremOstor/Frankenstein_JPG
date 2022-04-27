#!/bin/bash
sudo apt update && apt upgrade
sudo apt install ansible 
sudo useradd -m ansible-admin
echo "Enter username of remote host and his ip address"
read varname 
read varname1
echo "Username: $varname and his ip address: $varname1"
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub $varname@$varname1 -p 6576

