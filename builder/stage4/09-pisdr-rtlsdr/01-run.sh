#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/RTLSDR"
cd 		    "/home/${FIRST_USER_NAME}/RTLSDR"

if [ ! -d "SoapyRTLSDR" ]; then
    git clone https://github.com/pothosware/SoapyRTLSDR.git
fi

cd SoapyRTLSDR
git pull
mkdir -p build
cd build
cmake -DCMAKE_CXX_FLAGS=-latomic ../
make -j$(nproc) install
ldconfig
EOF