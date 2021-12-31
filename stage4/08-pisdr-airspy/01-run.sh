#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "airspyhf" ]; then
    git clone --depth 1 https://github.com/airspy/airspyhf.git
fi

cd airspyhf
mkdir -p build
cd build
cmake -GNinja -DINSTALL_UDEV_RULES=ON .. 
ninja install
ldconfig
cd ..
rm -fr build
EOF