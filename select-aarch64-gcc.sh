#########################################################################
# File Name: select-aarch64-gcc.sh
# Author: Cixi.Geng
# mail: cixi.geng@unisoc.com
# Created Time: Wed Jan 27 17:55:09 2021
#########################################################################
#!/bin/bash

CROSS_COMPILE_VERSIONS="7 8"
BIN_NAME_LIST="
aarch64-linux-gnu-cpp
aarch64-linux-gnu-g++
aarch64-linux-gnu-gcc
aarch64-linux-gnu-gcc-ar
aarch64-linux-gnu-gcc-nm
aarch64-linux-gnu-gcc-ranlib
aarch64-linux-gnu-gcov
aarch64-linux-gnu-gcov-dump
aarch64-linux-gnu-gcov-tool
arm-linux-gnueabihf-cpp
arm-linux-gnueabihf-g++
arm-linux-gnueabihf-gcc
arm-linux-gnueabihf-gcc-ar
arm-linux-gnueabihf-gcc-nm
arm-linux-gnueabihf-gcc-ranlib
arm-linux-gnueabihf-gcov
arm-linux-gnueabihf-gcov-dump
arm-linux-gnueabihf-gcov-tool
"
BASE_BIN_LIST="
cpp
g++
gcc
gcc-ar
gcc-nm
gcc-ranlib
gcov
gcov-dump
gcov-tool
"
sudo add-apt-repository ppa:ubuntu-toolchain-r/test

sudo apt-get update

install_cross_tools()
{
	for version in ${CROSS_COMPILE_VERSIONS}
	do
		sudo apt install gcc-${version}-aarch64-linux-gnu
		sudo apt install g++-${version}-aarch64-linux-gnu
		sudo apt install gcc-${version}-arm-linux-gnueabihf
		sudo apt install g++-${version}-arm-linux-gnueabihf
	done 
}

install_cross_tools

for link in ${BIN_NAME_LIST}
do
	for version in ${CROSS_COMPILE_VERSIONS}
	do
		echo "
		sudo update-alternatives --install /usr/bin/${link} ${link} /usr/bin/${link}-${version} ${version}0 "
		sudo update-alternatives --install \
			 /usr/bin/${link} ${link} \
			/usr/bin/${link}-${version} ${version}0
	done
done


for link in ${BIN_NAME_LIST}
do
	sudo update-alternatives --config ${link}
done
