#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "hackrf" ]; then
    git clone https://github.com/mossmann/hackrf.git
fi

cd hackrf/host
mkdir -p build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make -j$(nproc) install
ldconfig
EOF