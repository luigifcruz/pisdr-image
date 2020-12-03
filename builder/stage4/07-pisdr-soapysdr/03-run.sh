#!/bin/bash

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 	    	"/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "gr-soapy" ]; then
    git clone --depth 1 https://gitlab.com/librespacefoundation/gr-soapy.git
fi

cd gr-soapy
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF
