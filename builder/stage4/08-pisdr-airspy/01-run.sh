#!/bin/bash -e

on_chroot << EOF
mkdir -p    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Airspy"
cd 		    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Airspy"

if [ ! -d "airspyhf" ]; then
    git clone https://github.com/airspy/airspyhf.git
fi

cd airspyhf
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../ -DINSTALL_UDEV_RULES=ON
make -j$(nproc)
make install
ldconfig
EOF


