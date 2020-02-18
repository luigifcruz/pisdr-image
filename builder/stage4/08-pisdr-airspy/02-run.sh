#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/Airspy"
cd 		    "/home/${FIRST_USER_NAME}/Airspy"

if [ ! -d "SoapyAirspy" ]; then
    git clone https://github.com/pothosware/SoapyAirspy.git
fi

cd SoapyAirspy
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake -DCMAKE_CXX_FLAGS=-latomic ../
make -j$(nproc) install
ldconfig
EOF


