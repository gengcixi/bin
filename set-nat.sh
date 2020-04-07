#!/bin/sh
#111.205.161.50
sudo iptables -A FORWARD -i usb0 -o eth0 -j ACCEPT
sudo iptables -A FORWARD -i eth0 -o usb0 -m state --state ESTABLISHED,RELATED -j ACCEPT
sudo  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
