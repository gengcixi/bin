#########################################################################
# File Name: check_root.sh
# Author: Cixi.Geng
# mail: cixi.geng@unisoc.com
# Created Time: 2020年01月15日 星期三 16时08分07秒
#########################################################################
#!/bin/bash

check_root()
{
	if [ "$(id -u)" != "0" ];then
		echo "superuser privileges are required to run"
		echo "sudo ./scripts.sh "
		exit 1
	fi
}

check_root
