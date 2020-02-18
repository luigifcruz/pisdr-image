#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/Software"
cd 		    "/home/${FIRST_USER_NAME}/Software"

if [ ! -d "gqrx" ]; then
    git clone https://github.com/csete/gqrx.git
fi

cd gqrx
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../
make -j$(nproc) install
ldconfig
EOF