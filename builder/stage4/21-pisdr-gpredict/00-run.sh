#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "gpredict" ]; then
    git clone https://github.com/csete/gpredict.git
fi

cd gpredict
git pull
bash autogen.sh
make -j$(nproc) install
ldconfig
EOF