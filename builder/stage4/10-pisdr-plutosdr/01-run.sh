#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PlutoSDR"
cd 		    "/home/${FIRST_USER_NAME}/PlutoSDR"

if [ ! -d "libad9361-iio" ]; then
    git clone https://github.com/analogdevicesinc/libad9361-iio
fi

cd libad9361-iio
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake ../ -DINSTALL_UDEV_RULE=ON
make -j$(nproc) install
ldconfig
EOF