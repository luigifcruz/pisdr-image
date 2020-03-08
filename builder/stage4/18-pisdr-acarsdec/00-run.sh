#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "acarsdec" ]; then
    git clone https://github.com/TLeconte/acarsdec.git
fi

cd acarsdec
mkdir -p build
cd build
cmake ../
make -j$(nproc) install
ldconfig
EOF