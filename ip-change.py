#!/usr/bin/env python3
#-*- coding:utf-8 -*-

#---------------------------------------------
#THIS PYTHON CODE INCREASE YOUR LOCAL IP
#			FROM 2 TO 254
#---------------------------------------------

import os
import socket
from time import sleep
ip_main = "192.168.1."
def getIP():
	s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
	s.connect(("192.168.1.1",0))
	return s.getsockname()[0]

for i in range(2,254):
	os.system("ifconfig wlp3s0 "+ip_main+str(i)+" broadcast 192.168.1.255 netmask 255.255.255.0")
	print("Command = \"ifconfig wlp3s0 "+ip_main+str(i)+" broadcast 192.168.1.255 netmask 255.255.255.0\"")
	print("Your's new local IP is "+getIP()) 
	sleep(1)   # Sleep command indicate how many seconds wait while ip changing
	

