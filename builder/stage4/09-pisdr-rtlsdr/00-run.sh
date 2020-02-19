#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/RTLSDR"
cd 		    "/home/${FIRST_USER_NAME}/RTLSDR"

if [ ! -d "rtl-sdr" ]; then
    git clone https://github.com/osmocom/rtl-sdr
fi

cd rtl-sdr
git pull
mkdir -p build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON
make -j$(nproc) install
ldconfig
EOF