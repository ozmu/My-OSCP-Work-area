#!/bin/bash

#---------------------------------------------
#THIS BASH SCRIPT INCREASE YOUR LOCAL IP
#			FROM 2 TO 254  (wlp3s0 is my wifi interface)
#---------------------------------------------

ip_main="192.168.1."
val=2
while [ $val -lt 255 ]
do
	ifconfig wlp3s0 "$ip_main""$val" broadcast 192.168.1.255 netmask 255.255.255.0
	echo Command = \"ifconfig wlp3s0 "$ip_main""$val" broadcast 192.168.1.255 netmask 255.255.255.0\"
	echo -n "Your's IP is "
	ifconfig -a | grep -A 1 'wlp3s0' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1
	val=`expr $val + 1`
	sleep 1
done

