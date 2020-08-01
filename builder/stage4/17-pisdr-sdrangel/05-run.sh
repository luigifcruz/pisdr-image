#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "sdrangel" ]; then
    git clone https://github.com/f4exb/sdrangel.git
fi

cd sdrangel
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
EOF