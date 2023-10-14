#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "libiio" ]; then
    git clone --depth 1 --branch libiio-v0 https://github.com/analogdevicesinc/libiio
fi

cd libiio
mkdir -p build
cd build
cmake -GNinja -DINSTALL_UDEV_RULE=ON ..
ninja install
ldconfig
cd ..
rm -fr build
EOF