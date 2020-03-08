#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "libacars" ]; then
    git clone https://github.com/szpajder/libacars.git
fi

cd libacars
mkdir -p build
cd build
cmake ../
make -j$(nproc) install
ldconfig
EOF