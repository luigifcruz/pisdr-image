#!/bin/bash

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/Packages"
cd 	    	"/home/${FIRST_USER_NAME}/Packages"

if [ ! -d "SoapySDR" ]; then
    git clone https://github.com/pothosware/SoapySDR.git
fi

cd SoapySDR
git pull
mkdir -p build
cd build
cmake ../
make -j$(nproc) install
ldconfig
EOF