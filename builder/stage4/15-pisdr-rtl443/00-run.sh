#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "rtl_433" ]; then
    git clone https://github.com/merbanan/rtl_433.git
fi

cd rtl_433
mkdir -p build
cd build
cmake ../
make -j$(nproc) install
ldconfig
EOF