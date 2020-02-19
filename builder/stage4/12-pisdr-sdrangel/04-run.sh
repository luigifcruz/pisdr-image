#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/Software"
cd 		    "/home/${FIRST_USER_NAME}/Software"

if [ ! -d "codec2" ]; then
    git clone https://github.com/drowe67/codec2.git
fi

cd codec2
git pull
git reset --hard 76a20416d715ee06f8b36a9953506876689a3bd2
mkdir -p build
cd build
cmake ../
make -j$(nproc) install
ldconfig
EOF