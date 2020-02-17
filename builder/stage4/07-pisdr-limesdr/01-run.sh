#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"${ROOTFS_DIR}/home/${FIRST_USER_NAME}/LimeSDR"
cd 		    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/LimeSDR"

if [ ! -d "gr-limesdr" ]; then
    git clone https://github.com/myriadrf/gr-limesdr.git
fi

cd gr-limesdr
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../
make -j$(nproc)
make install
ldconfig
EOF
