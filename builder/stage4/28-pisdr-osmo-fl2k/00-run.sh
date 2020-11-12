#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "osmo-fl2k" ]; then
    git clone git://git.osmocom.org/osmo-fl2k.git
fi

cd osmo-fl2k
mkdir -p build
cd build
cmake -GNinja -DINSTALL_UDEV_RULES=ON ..
ninja install
ldconfig
cd ..
rm -fr build
EOF