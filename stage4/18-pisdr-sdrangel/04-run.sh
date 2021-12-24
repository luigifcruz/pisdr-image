#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "codec2" ]; then
    git clone https://github.com/drowe67/codec2.git
fi

cd codec2
git reset --hard 76a20416d715ee06f8b36a9953506876689a3bd2
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF