#!/bin/bash

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 	    	"/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "SoapySDR" ]; then
    git clone https://github.com/pothosware/SoapySDR.git
fi

cd SoapySDR
mkdir -p build
cd build
cmake ../
make -j$(nproc) install
ldconfig
EOF