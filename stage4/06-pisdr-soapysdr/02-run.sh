#!/bin/bash

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 	    	"/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "SoapyRemote" ]; then
    git clone --depth 1 https://github.com/pothosware/SoapyRemote.git
fi

cd SoapyRemote
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF