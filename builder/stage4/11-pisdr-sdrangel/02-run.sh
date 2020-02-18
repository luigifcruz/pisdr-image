#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/Software"
cd 		    "/home/${FIRST_USER_NAME}/Software"

if [ ! -d "serialDV" ]; then
    git clone https://github.com/f4exb/serialDV.git
fi

cd serialDV
git pull
git reset --hard "v1.1.4"
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../
make -j$(nproc) install
ldconfig
EOF