#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "gnuradio" ]; then
    git clone --recursive https://github.com/gnuradio/gnuradio.git
fi

cd gnuradio
git checkout maint-3.8
git submodule update --init --recursive
mkdir -p build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
ninja install
ldconfig
EOF