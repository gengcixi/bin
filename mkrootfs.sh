#!/bin/bash 

ln linuxrc init

echo " mkdir rootfs dir "
mkdir -pv dev etc/init.d home mnt proc root sys tmp var opt root 
cd dev/ 
sudo mknod console c 5 1
sudo mknod null c 1 3
cd ../etc/
echo """ proc /proc proc defaults 0 0
sysfs /sys sysfs defaults 0 0
none /dev/pts devpts mode=0622 0 0
tmpfs /dev/shm tmpfs defaults 0 0""" >fstab

echo "root:x:0:" >group
echo "root:x:0:0:root:/root:/bin/sh">passwd
echo "root:/Z4vSfch3M0EI:0:0:99999:7:::">shadow

echo """::sysinit:/etc/init.d/rcS
#::respawn:-/bin/sh
::respawn:-/bin/login
tty2::askfirst:-/bin/sh
::ctrlaltdel:/bin/umount -a -r""">inittab
echo """# /etc/profile: system-wide .profile file for the Bourne shells
echo
echo -n "Processing /etc/profile... "
# no-op
echo "Done"
echo
/bin/hostname sprd
USER="`id -un`"
LOGNAME=$USER
HOSTNAME='/bin/hostname'
PS1='[\u@\h \W]#""">profile





echo """#! /bin/sh
/bin/mount -n -t ramfs ramfs /var
/bin/mount -n -t ramfs ramfs /tmp
/bin/mount -n -t sysfs none /sys
/bin/mount -n -t ramfs none /dev
/bin/mkdir /var/tmp
/bin/mkdir /var/modules
/bin/mkdir /var/run
/bin/mkdir /var/log
/bin/mkdir -p /dev/pts
/bin/mkdir -p /dev/shm
/sbin/mdev -s
/bin/mount -a
echo /sbin/mdev > /proc/sys/kernel/hotplug
mknod dev/tty0 c 4 0
mknod dev/tty1 c 4 1
mknod dev/tty2 c 4 2""" >init.d/rcS
chmow 777 init.d/rcS

cp ~/workspace/work/sprdisk/arm64/buildroot/output/target/opt/ltp.tar.bz2 opt/ -raf
cp ~/workspace/work/sprdisk/arm64/buildroot/output/target/lib* . -raf
 

