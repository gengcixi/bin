#########################################################################
# File Name: demo.sh
# Author: Cixi.Geng
# mail: cixi.geng@unisoc.com
#########################################################################
#!/bin/bash
#
TOPDIR=$(dirname `readlink -f $0`)

echo ${TOPDIR} 

function echo_info()
{
	echo -e "\033[33m	$*	\033[0m"
	echo -e "\033[31m	红色字	\033[0m"
}

# check return error
function check_err()
{
	if [ $? -ne 0 ]; then
		echo -e "\033[31m FAIL: $* \033[0m" >&2
		return_val=1
		return
	else
		echo -e "\033[33m PASS: $* \033[0m" >&2
		return_val=0
	fi
}

function get_parameter()
{
	if [ $1 ];then
		echo $1
	else
		read para
		case $para in
			1)
				echo_info $para
				;;
			2)
				echo_info $para
				;;
			*)
				echo not right para
				;;
		esac
	fi
}
get_parameter

