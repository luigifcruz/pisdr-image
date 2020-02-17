#!/bin/bash -e

on_chroot << EOF
mkdir -p    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PlutoSDR"
cd 		    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PlutoSDR"

if [ ! -d "libiio" ]; then
    git clone https://github.com/analogdevicesinc/libiio
fi

cd libiio
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../ -DINSTALL_UDEV_RULE=ON
make -j$(nproc)
make install
ldconfig
EOF