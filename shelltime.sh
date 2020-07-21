#########################################################################
# File Name: shelltime.sh
# Author: Cixi.Geng
# mail: cixi.geng@unisoc.com
# Created Time: Fri Jun  5 14:26:40 2020
#########################################################################
#!/bin/bash

startTime=`date +%Y%m%d-%H:%M:%S`
startTime_s=`date +%s`

endTime=`date +%Y%m%d-%H:%M:%S`
endTime_s=`date +%s`

sumTime=$[ $endTime_s - $startTime_s ]

echo "$startTime ---> $endTime" "Total:$sumTime seconds"

function logcmd()
{
	echo -e "\n"
	echo -n "$@"
	echo -n " on "
	date '+%m-%d %T'
}

function exe_cmd()
{
	logcmd "$@";
	eval $@;
	echo -n "run finished on "
	date '+%m-%d %T'
}

exe_cmd "cat /proc/meminfo"
