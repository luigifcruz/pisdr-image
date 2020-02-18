#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/Software"
cd 		    "/home/${FIRST_USER_NAME}/Software"

if [ ! -d "mbelib" ]; then
    git clone https://github.com/szechyjs/mbelib.git
fi

cd mbelib
git pull
git reset --hard 9a04ed5c78176a9965f3d43f7aa1b1f5330e771f
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../
make -j$(nproc) install
ldconfig
EOF