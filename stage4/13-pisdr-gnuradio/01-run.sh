#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "gnuradio" ]; then
    git clone --single-branch --branch maint-3.9 --depth 1 --recurse-submodules --shallow-submodules https://github.com/gnuradio/gnuradio.git
fi

cd gnuradio
git submodule update --init --recursive
mkdir -p build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
ninja install
ldconfig
cd ..
rm -fr build
EOF
