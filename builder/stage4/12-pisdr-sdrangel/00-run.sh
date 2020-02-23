#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "cm256cc" ]; then
    git clone https://github.com/f4exb/cm256cc.git
fi

cd cm256cc
git pull
git reset --hard f21e8bc1e9afdb0b28672743dcec111aec1d32d9
mkdir -p build
cd build
cmake ../
make -j$(nproc) install
ldconfig
EOF