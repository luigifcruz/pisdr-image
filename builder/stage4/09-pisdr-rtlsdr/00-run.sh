#!/bin/bash -e

on_chroot << EOF
mkdir -p    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/RTLSDR"
cd 		    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/RTLSDR"

if [ ! -d "rtl-sdr" ]; then
    git clone https://github.com/osmocom/rtl-sdr
fi

cd rtl-sdr
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON
make -j$(nproc)
make install
ldconfig
EOF