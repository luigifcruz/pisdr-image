#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "rtl-ais" ]; then
    git clone --depth 1 https://github.com/dgiardini/rtl-ais.git
fi

cd rtl-ais
make -j$(nproc)
make install
ldconfig
EOF