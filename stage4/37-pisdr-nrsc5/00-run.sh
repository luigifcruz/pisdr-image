#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "nrsc5" ]; then
    git clone --depth 1 https://github.com/theori-io/nrsc5.git
fi

cd nrsc5
mkdir -p build
cd build
cmake -DUSE_NEON=ON -DUSE_FAAD2=OFF -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF