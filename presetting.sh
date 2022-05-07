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
read username 
read ip_addr
echo "Username: $username and his ip address: $ip_addr"
File=/root/.ssh/id_rsa.pub
if [ -f "$File "]
then
 echo "$File exists."
else
ssh-keygen
fi
ssh-copy-id -i ~/.ssh/id_rsa.pub $username@$ip_addr -p 6576

