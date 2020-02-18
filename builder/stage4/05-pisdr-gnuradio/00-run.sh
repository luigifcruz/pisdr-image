#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/LimeSDR"
cd 		    "/home/${FIRST_USER_NAME}/LimeSDR"

if [ ! -d "gnuradio" ]; then
    git clone --recursive https://github.com/gnuradio/gnuradio.git
fi

cd gnuradio
git pull
git checkout maint-3.7
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/local/bin/python3 ../
make -j$(nproc) install
ldconfig
EOF
