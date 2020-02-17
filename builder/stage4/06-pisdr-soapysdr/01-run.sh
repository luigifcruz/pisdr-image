#!/bin/bash

on_chroot << EOF
mkdir -p 	"${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Packages"
cd 	    	"${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Packages"

if [ ! -d "SoapySDR" ]; then
    git clone https://github.com/pothosware/SoapySDR.git
fi

cd SoapySDR
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../
make -j$(nproc)
make install
ldconfig
EOF