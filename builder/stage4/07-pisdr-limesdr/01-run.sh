#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/LimeSDR"
cd 		    "/home/${FIRST_USER_NAME}/LimeSDR"

if [ ! -d "gr-limesdr" ]; then
    git clone https://github.com/myriadrf/gr-limesdr.git
fi

cd gr-limesdr
git pull
mkdir -p build
cd build
cmake -DCMAKE_CXX_FLAGS=-latomic ../
make -j$(nproc) install
ldconfig
EOF
