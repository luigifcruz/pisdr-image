#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "gpredict" ]; then
    git clone --depth 1 https://github.com/csete/gpredict.git
fi

cd gpredict
bash autogen.sh
make -j$(nproc) install
ldconfig
EOF