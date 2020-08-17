#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "gqrx" ]; then
    git clone https://github.com/csete/gqrx.git
fi

cd gqrx
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF
