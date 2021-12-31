#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "gr-sdrplay3" ]; then
    git clone --single-branch --branch master --depth 1 https://github.com/fventuri/gr-sdrplay3.git
fi

cd gr-sdrplay3
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF
