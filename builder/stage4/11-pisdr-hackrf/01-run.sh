#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "SoapyHackRF" ]; then
    git clone https://github.com/pothosware/SoapyHackRF.git
fi

cd SoapyHackRF
mkdir -p build
cd build
cmake -DCMAKE_CXX_FLAGS=-latomic ../
make -j$(nproc) install
ldconfig
EOF