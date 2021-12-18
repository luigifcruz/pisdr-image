#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "LimeSuite" ]; then
    git clone --depth 1 https://github.com/myriadrf/LimeSuite.git
fi

cd LimeSuite
mkdir -p build
cd build
cmake -GNinja -DCMAKE_CXX_FLAGS=-latomic ..
ninja install
ldconfig
cd ..
rm -fr build

cd udev-rules
./install.sh
EOF
