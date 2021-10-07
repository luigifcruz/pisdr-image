#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/System"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/System"

if [ ! -d "pybind11" ]; then
    git clone --depth 1 https://github.com/pybind/pybind11.git
fi

cd pybind11
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF
