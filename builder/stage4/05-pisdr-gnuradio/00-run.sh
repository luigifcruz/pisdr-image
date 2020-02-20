#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/GNURadio"
cd 		    "/home/${FIRST_USER_NAME}/GNURadio"

if [ ! -d "gnuradio" ]; then
    git clone --recursive https://github.com/gnuradio/gnuradio.git
fi

cd gnuradio
git pull
git checkout maint-3.7
mkdir -p build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python ../
make -j$(nproc) install
ldconfig
EOF
