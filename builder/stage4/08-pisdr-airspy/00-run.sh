#!/bin/bash -e

on_chroot << EOF
mkdir -p    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Airspy"
cd 		    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Airspy"

if [ ! -d "airspyone_host" ]; then
    git clone https://github.com/airspy/airspyone_host.git
fi

cd airspyone_host
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../ -DINSTALL_UDEV_RULES=ON
make -j$(nproc)
make install
ldconfig
EOF