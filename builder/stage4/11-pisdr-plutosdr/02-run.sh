#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "gr-iio" ]; then
    git clone --single-branch --branch upgrade-3.8 --depth 1 https://github.com/analogdevicesinc/gr-iio
fi

cd gr-iio
mkdir -p build
cd build
cmake -GNinja -DINSTALL_UDEV_RULE=ON ..
ninja install
ldconfig
cd ..
rm -fr build
EOF