#/bin/bash

# This script is primary ping the target (192.168.2.1-255), if the target is running, scan the ports using nmap.
# And if 80 port is open, it print "80 port's state is 'open' on <target ip>"

clear
echo "This script is scan the all subnetwork.And print the devices that open 80th port. (http)."
for i in `seq 1 255`
do
  command=$(ping 192.168.2.$i -c 1|grep received|awk '{print $4}')
  if [ $command -eq 1 ]
    then
        val=$(nmap -sS -vv 192.168.2.$i|grep 80/tcp)
	if [ $? -eq 0 ]
	then
		echo "80 port's state is 'open' on 192.168.2.$i"
	else
		echo "80 port's state is 'close' on 192.168.2.$i"
	fi
  fi
done
