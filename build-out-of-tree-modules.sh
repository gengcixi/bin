#!/bin/bash

TOPDIR=`pwd`
KERNEL_VERSION=kernel4.14
KERNEL_SRC=$TOPDIR/kernel/kernel4.14
KERNEL_BUILD=$TOPDIR/output/build
BSP_KERNEL_PATH=$KERNEL_BUILD
KERNEL_MOD_PATH=$TOPDIR/output/kernel

build_kernel()
{
	make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -C $KERNEL_SRC O=$KERNEL_BUILD sprd_sharkl3_defconfig
	make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -C $KERNEL_SRC O=$KERNEL_BUILD Image
	make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -C $KERNEL_SRC INSTALL_MOD_PATH=$KERNEL_MOD_PATH O=$KERNEL_BUILD modules
	make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -C $KERNEL_SRC INSTALL_MOD_PATH=$KERNEL_MOD_PATH O=$KERNEL_BUILD modules_install

}
build_kernel
BSP_MOD_PATH_LIST=`find $TOPDIR/modules -type f -name "Makefile" |grep -E "$KERNEL_VERSION|camera"`
KERNELRELEASE=`cat $KERNEL_BUILD/include/config/kernel.release`
echo $KERNELRELEAS
export BSP_MODULES_OUT=${KERNEL_MOD_PATH}/lib/modules/${KERNELRELEASE}
echo =======BSP_MODULES_OUT=$BSP_MODULES_OUT
source modules.cfg 

for MODULE_NAME in $BSP_MODULES_LIST
do
	MOD_NAME=${MODULE_NAME%.ko}
	for MOD_PATH in $BSP_MOD_PATH_LIST
	do
		DETCET_NAME=`grep -w "KO_MODULE_NAME :=" $MOD_PATH | awk -F':= ' '{print $NF}'`
		if (cat $MOD_PATH | grep -w "$MOD_NAME\.o\|KO_MODULE_NAME\s*:=\s*$MOD_NAME" > /dev/null); then
			echo "find $MOD_NAME in $MOD_PATH"
            echo ${MOD_PATH%/*}
			make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -C $KERNEL_SRC M=${MOD_PATH%/*} INSTALL_MOD_PATH=$KERNEL_MOD_PATH O=$KERNEL_BUILD modules
			make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -C $KERNEL_SRC M=${MOD_PATH%/*} INSTALL_MOD_PATH=$KERNEL_MOD_PATH O=$KERNEL_BUILD modules_install
		fi
	done
done
