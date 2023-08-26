#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "uhd" ]; then
    git clone --single-branch --branch UHD-4.4 --depth 1 https://github.com/EttusResearch/uhd.git
fi

cd uhd/host
mkdir -p build
cd build
cmake -GNinja -DNEON_SIMD_ENABLE=ON -DCMAKE_BUILD_TYPE=Release ../
ninja install
cp /usr/local/lib/uhd/utils/uhd-usrp.rules /etc/udev/rules.d/
ldconfig
uhd_images_downloader
cd ..
rm -fr build
EOF
