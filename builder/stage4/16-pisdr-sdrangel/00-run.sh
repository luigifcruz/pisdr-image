#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "cm256cc" ]; then
    git clone https://github.com/f4exb/cm256cc.git
fi

cd cm256cc
git reset --hard c0e92b92aca3d1d36c990b642b937c64d363c559
mkdir -p build
cd build
cmake ../
make -j$(nproc) install
ldconfig
EOF
