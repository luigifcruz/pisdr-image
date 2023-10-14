#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "CyberEther" ]; then
    git clone --branch development --depth 1 https://github.com/luigifcruz/CyberEther.git
    cd CyberEther
    meson -Dbuildtype=debugoptimized build
    cd build
    ninja
fi
EOF
