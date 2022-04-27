# Frankenstein_JPG
### JPG = Jenkins + Prometheus + Grafana

#### Presetting:
Run presetting.sh bash-script for presetting on the server.
1) ```chmod +x presetting.sh```
2) ```./presetting.sh```


#### Run this playbook:
For running this playbook:
1) Type ```ansible-playbook frankenstein.yml --ask-vault-pass``` in your cmd
2) Enter password for Ansible Vault - **qwe123**.
#### Change password:
To change password for remote login as root:

1) Type ```echo -n "YourRemoteRootPassword" | ansible-vault encrypt_string``` in your cmd
2) Enter new password(_recommended to use the only one password for all of your vaults_).
3) Copy encrypted text since **!vault**
4) Paste it to your server file(_**group_vars/jenkins** or **group_vars/prometheus** or **group_vars/grafana**_)
