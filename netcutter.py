#!/usr/bin/python3

import telnetlib
import getpass

def connect(user,passwd,ip_addr,option):
    tn = telnetlib.Telnet("192.168.2.1")
    tn.write(user.encode("utf-8") + b"\n")
    tn.write(passwd.encode("utf-8") + b"\n")
    tn.write(b"iptables " + option.encode("utf-8") + b" INPUT -s "+ip_addr.encode("utf-8")+ b" -j DROP\n")
    tn.write(b"exit\n")
    return tn.read_all()

ip_addr= input("Victim's IP Adress: ")
user = input("Gateway Interface Username: ")
passwd = getpass.getpass("Password: ")
val = ""
option = int(input(""" What do you want ?
    1) Switch On
    2) Switch Off
    """))
if option == 1:
    val = "-D"
elif option == 2:
    val = "-A"
else:
    print("Wrong value!")

print(connect(user,passwd,ip_addr,val))
