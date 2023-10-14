#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "sdrangel" ]; then
    git clone --depth 1 --branch v7.15.3 https://github.com/f4exb/sdrangel.git
fi

cd sdrangel
mkdir -p build
cd build
cmake -DSOAPYSDR_DIR=/usr/local -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF
