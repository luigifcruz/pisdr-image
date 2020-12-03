#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "dump1090" ]; then
    git clone --depth 1 https://github.com/antirez/dump1090.git
fi

cd dump1090
make -j$(nproc)
cp dump1090 /usr/bin/   
EOF