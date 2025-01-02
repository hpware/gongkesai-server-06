user="FedoraUser"
pwd="Passwors"
for item in $(seq -f "%02g" 1 1 50)
do
	echo -ne "$pwd\n$pwd\n" | smbpasswd -a -s $u$i
done