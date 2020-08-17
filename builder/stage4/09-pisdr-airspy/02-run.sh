#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "SoapyAirspy" ]; then
    git clone https://github.com/pothosware/SoapyAirspy.git
fi

cd SoapyAirspy
mkdir -p build
cd build
cmake -GNinja -DCMAKE_CXX_FLAGS=-latomic ..
ninja install
ldconfig
cd ..
rm -fr build
EOF