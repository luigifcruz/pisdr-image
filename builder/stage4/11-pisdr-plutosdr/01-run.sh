#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "libad9361-iio" ]; then
    git clone https://github.com/analogdevicesinc/libad9361-iio
fi

cd libad9361-iio
mkdir -p build
cd build
cmake -GNinja -DINSTALL_UDEV_RULE=ON ..
ninja install
ldconfig
cd ..
rm -fr build
EOF