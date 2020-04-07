#!/bin/bash
ifconfig usb0 down
ifconfig usb0 hw ether d2:8e:db:6b:74:18
ifconfig usb0 192.168.8.1 netmask 255.255.255.0
ifconfig usb0 up
