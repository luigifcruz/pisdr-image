#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "uhd" ]; then
    git clone --single-branch --branch UHD-3.15.LTS --depth 1 https://github.com/EttusResearch/uhd.git
fi

cd uhd/host
mkdir -p build
cd build
cmake -DCMAKE_CXX_FLAGS:STRING="-march=armhf -Wno-psabi" \
      -DCMAKE_C_FLAGS:STRING="-march=armhf -Wno-psabi" \
      -DCMAKE_ASM_FLAGS:STRING="-march=armhf" \
      -GNinja -DCMAKE_BUILD_TYPE=Release ../
ninja install
cp /usr/local/lib/uhd/utils/uhd-usrp.rules /etc/udev/rules.d/
ldconfig
uhd_images_downloader
cd ..
rm -fr build
EOF
