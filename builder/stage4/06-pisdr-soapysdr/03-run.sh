#!/bin/bash

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/Packages"
cd 	    	"/home/${FIRST_USER_NAME}/Packages"

if [ ! -d "gr-soapy" ]; then
    git clone https://gitlab.com/librespacefoundation/gr-soapy.git
fi

cd gr-soapy
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../
make -j$(nproc) install
ldconfig
EOF