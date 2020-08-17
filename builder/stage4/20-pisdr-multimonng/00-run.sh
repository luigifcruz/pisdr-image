#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "multimon-ng" ]; then
    git clone https://github.com/EliasOenal/multimon-ng.git
fi

cd multimon-ng
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF