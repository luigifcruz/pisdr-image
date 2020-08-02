#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "dsdcc" ]; then
    git clone https://github.com/f4exb/dsdcc.git
fi

cd dsdcc
git reset --hard "v1.9.0"
mkdir -p build
cd build
cmake -GNinja -DUSE_MBELIB=ON  ..
ninja install
ldconfig
EOF
