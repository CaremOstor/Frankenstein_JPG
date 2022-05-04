#!/bin/bash
apt update && apt upgrade
if apt -qq list ansible 2>/dev/null | grep -q installed ;
then
 echo "Anisble is installed"
else
 apt install ansible
fi
useradd -m ansible-admin 
echo "Enter username of remote host and his ip address"
read varname 
read varname1
echo "Username: $varname and his ip address: $varname1"
File=/root/.ssh/id_rsa.pub
if [ -f "$File "]
then
 echo "$File exists."
else
ssh-keygen
fi
ssh-copy-id -i ~/.ssh/id_rsa.pub $varname@$varname1 -p 6576

