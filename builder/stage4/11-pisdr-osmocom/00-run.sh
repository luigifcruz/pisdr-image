#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "gr-osmosdr" ]; then
    git clone git://git.osmocom.org/gr-osmosdr
fi

cd gr-osmosdr
git pull
git checkout gr3.7
mkdir -p build
cd build
cmake ../
make -j$(nproc) install
ldconfig
EOF