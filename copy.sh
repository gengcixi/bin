#!/bin/sh

# check return error
check_err()
{
	if [ $? -ne 0 ]; then
		echo "\033[31m FAIL: $* \033[0m" >&2
		return_val=1
		return
	else
		echo "\033[33m PASS: $* \033[0m" >&2
		return_val=0
	fi
}

if [ -d /media/cixi.geng1/debian ];then
	echo "Clean old rootfs date..."
	sudo rm -rf /media/cixi.geng1/debian/*
	check_err "Clean rootfs"
	if [ ${return_val} -eq 0 ]; then
		echo "Starting copy rootfs to sdcard"
		sudo rsync -axHAX /home/cixi.geng1/workspace/sprdebian_trunk/output/arm64/rootfs-arm64/* /media/cixi.geng1/debian
		echo "copy done"
		check_err "copy rootfs"
		sync
		check_err "sync"
	fi
else
	echo "can not find sd card"
fi
