#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "gr-limesdr" ]; then
    git clone https://github.com/myriadrf/gr-limesdr.git
fi

cd gr-limesdr
mkdir -p build
cd build
cmake -DCMAKE_CXX_FLAGS=-latomic ../
make -j$(nproc) install
ldconfig
EOF
