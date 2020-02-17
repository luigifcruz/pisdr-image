#!/bin/bash -e

on_chroot << EOF
mkdir -p    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Software"
cd 		    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Software"

if [ ! -d "cm256cc" ]; then
    git clone https://github.com/f4exb/cm256cc.git
fi

cd cm256cc
git pull
git reset --hard f21e8bc1e9afdb0b28672743dcec111aec1d32d9
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../
make -j$(nproc)
make install
ldconfig
EOF