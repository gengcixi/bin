#########################################################################
# File Name: demo.sh
# Author: Cixi.Geng
# mail: cixi.geng@unisoc.com
#########################################################################
#!/bin/bash
#
TOPDIR=$(dirname `readlink -f $0`)

kill `ps -a |grep qemu-sys |awk -F' ' '{print $1}'`
