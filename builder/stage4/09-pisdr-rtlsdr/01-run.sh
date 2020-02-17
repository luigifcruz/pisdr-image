#!/bin/bash -e

on_chroot << EOF
mkdir -p    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/RTLSDR"
cd 		    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/RTLSDR"

if [ ! -d "SoapyRTLSDR" ]; then
    git clone https://github.com/pothosware/SoapyRTLSDR.git
fi

cd SoapyRTLSDR
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake -DCMAKE_CXX_FLAGS=-latomic ../
make -j$(nproc)
make install
ldconfig
EOF