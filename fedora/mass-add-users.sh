u="" # Username starts with?

for i in $(seq -f "%02g" 1 1 50)

do 
	useradd -g {{ group }} -s /bin/bash $u$i
	echo "{{ password }}" | passwd --stdin $u$i
done
