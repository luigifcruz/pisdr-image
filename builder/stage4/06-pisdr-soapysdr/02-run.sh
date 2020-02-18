#!/bin/bash

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/Packages"
cd 	    	"/home/${FIRST_USER_NAME}/Packages"

if [ ! -d "SoapyRemote" ]; then
    git clone https://github.com/pothosware/SoapyRemote.git
fi

cd SoapyRemote
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../
make -j$(nproc) install
ldconfig
EOF