#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/Airspy"
cd 		    "/home/${FIRST_USER_NAME}/Airspy"

if [ ! -d "airspyone_host" ]; then
    git clone https://github.com/airspy/airspyone_host.git
fi

cd airspyone_host
git pull
mkdir -p build
cd build
cmake ../ -DINSTALL_UDEV_RULES=ON
make -j$(nproc) install
ldconfig
EOF