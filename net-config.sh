#!/bin/bash
sudo echo 1 >/proc/sys/net/ipv4/ip_forward 
iptables -A FORWARD -i usb0 -o eth0 -j ACCEPT
iptables -A FORWARD -i eth0 -o usb0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE 
