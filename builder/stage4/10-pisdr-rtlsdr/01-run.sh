#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "SoapyRTLSDR" ]; then
    git clone https://github.com/pothosware/SoapyRTLSDR.git
fi

cd SoapyRTLSDR
mkdir -p build
cd build
cmake -GNinja -DCMAKE_CXX_FLAGS=-latomic ..
ninja install
ldconfig
cd ..
rm -fr build
EOF