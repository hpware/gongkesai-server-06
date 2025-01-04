## Change Host Name
```bash
hostnamectl set-hostname {{ hostname }}
```
## Delete User
```bash
userde -r {{ user }}
```
## Add Group
```bash
groupadd {{ group }}
```
## Add User
```bash
useradd {{ user }}
```

## Check User
```bash
id {{ user }}
```
# Change SSH Port
```bash
vi /etc/ssh/sshd_config
```
Add 
```conf
Port {{ port }}
PermitRootLogin no
AllowUsers {{ user (Wildcard add ?) }} {{ user  (last num)}}
```
# Change Samba Sharing config
```bash
rm -rf /etc/samba/smb.conf
vi /etc/samba/smb.conf
```
```conf
[global]
	workgroup = SAMBA
	security = user
	passdb backend = tdbsam
[{{ samba share name }}]
	path={{ path }}
	writeable = yes
	valid users = {{ group }}
```
# Mass add Samba Share Users
```bash
user="Feusr"
pwd="Skills@2024"
for item in $(seq -f "%02g" 1 1 50)
do
	echo -ne "$pwd\n$pwd\n" | smbpasswd -a -s $u$i
done
```
# Disable Firewall-cmd
```bash
systemctl stop firewalld
systemctl disable firewalld
systemctl mask --now firewalld
```

# NFTables
```bash
iptables-nft -F
iptables-nft -X
iptables-nft -Z
iptables-nft -nL
iptables-nft -P INPUT DROP
iptables-nft -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
```
## Change Open Drops
```bash
iptables-nft -A INPUT -p tcp --dport 443 -j ACCEPT
iptables-nft -A INPUT -p tcp --dport 2224 -j ACCEPT
iptables-nft -A INPUT -p tcp --dport 137 -j ACCEPT
iptables-nft -A INPUT -p tcp --dport 138 -j ACCEPT
iptables-nft -A INPUT -p tcp --dport 139 -j ACCEPT
iptables-nft -A INPUT -p tcp --dport 445 -j ACCEPT
touch /etc/nftables/{{ name }}.nft
nft list ruleset | cat >> /etc/nftables/{{ name }}.nft
vi /etc/nftables/nftables.conf
```
### Config /etc/nftables/nftables.conf
```conf 
include "/etc/nftables/{{ name }}.conf"
```
### Restart 
```bash
shutdown -r
