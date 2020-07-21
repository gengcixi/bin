#!/bin/bash

# -hda /home/cixi.geng1/project/build_buildroot/output/images/rootfs.ext3 \
set -e

kill_nc_vsock() {
	sudo pkill nc-vsock
}
trap kill_nc_vsock EXIT

sudo /home/cixi.geng1/project/qemu-4.0.0/build/aarch64-softmmu/qemu-system-aarch64 \
	-machine virt \
	-cpu cortex-a57 \
	-smp 4 \
	-nographic \
	-m 4096 \
	-net user,hostfwd=tcp::10023-:22 -net nic  \
	-hda /home/cixi.geng1/rootfs/debian/rootfs.ext4 \
	-kernel /home/cixi.geng1/workspace/work/sprdlinux/common/output/arch/arm64/boot/Image \
	--append "earlyprintk=pl011,0x9000000 root=/dev/vda console=ttyAMA0 crashkernel=128M loglevel=8 panic=-1"
