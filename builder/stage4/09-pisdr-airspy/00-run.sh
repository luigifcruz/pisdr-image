#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "airspyone_host" ]; then
    git clone https://github.com/airspy/airspyone_host.git
fi

cd airspyone_host
mkdir -p build
cd build
cmake -GNinja -DINSTALL_UDEV_RULES=ON ..
ninja install
ldconfig
EOF