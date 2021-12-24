#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "glrpt" ]; then
    git clone --depth 1 https://github.com/dvdesolve/glrpt.git
fi

cd glrpt
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF