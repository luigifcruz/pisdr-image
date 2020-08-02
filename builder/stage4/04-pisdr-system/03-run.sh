#!/bin/bash -e

install -m 755 patch/ninja.patch "${ROOTFS_DIR}/etc/"

on_chroot << EOF
cd "/tmp"

if [ ! -d "ninja" ]; then
    git clone https://github.com/ninja-build/ninja.git
    cd ninja
    patch -u CMakeLists.txt -i /etc/ninja.patch
    mkdir -p build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release ..
    make -j$(nproc) install
    ldconfig
fi
EOF
