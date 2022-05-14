#!/bin/bash
if apt -qq list ansible 2>/dev/null | grep -q installed ;
then
 echo "Anisble is installed"
else
 apt install ansible
fi
useradd -m -s /bin/bash ansible-admin
passwd ansible-admin
File=/root/.ssh/id_rsa.pub
if [ -f "$File "]
then
 echo "$File exists."
else
ssh-keygen
fi
echo "Choose variant for sending ssh public key:"
echo "1 - Enter username and ip address of host"
echo "2 - Enter subnet and subnet mask of your network"
read variant;
case $variant in
  1) read -p "Username: " username && read -p "Ip address: " ip_addr && ssh-copy-id -i ~/.ssh/id_rsa.pub $username@$ip_addr -p 6576;;
  2) ping_check()
{
  ping -c 1 $1 > /dev/null
  [ $? -eq 0 ] && echo $i 
}
echo "Enter your subnet(only first 3 octets):"
read subnet
for i in $subnet.{1..254} 
do
ping_check $i >> hosts & disown 
done
cat hosts
hosts=$(cat hosts)
for prm in $hosts
do
        read -p "Enter username for $prm:" username
        ssh-copy-id -i ~/.ssh/id_rsa.pub $username@$prm -p 6576
done;;
   *) echo "Choose the correct option";;
esac


