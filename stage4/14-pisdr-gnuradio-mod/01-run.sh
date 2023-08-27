#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "gr-limesdr" ]; then
    git clone --single-branch --branch gr39 --depth 1 https://github.com/daniestevez/gr-limesdr.git
fi

cd gr-limesdr
mkdir -p build
cd build
cmake -GNinja -DCMAKE_CXX_FLAGS=-latomic ..
ninja install
ldconfig
cd ..
rm -fr build
EOF
