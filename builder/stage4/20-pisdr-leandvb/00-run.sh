#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "leansdr" ]; then
    git clone https://github.com/pabr/leansdr.git
fi

cd leansdr/src/apps
make -j$(nproc)
ldconfig
EOF