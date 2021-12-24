#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "xwxapt" ]; then
    mkdir -p xwxapt
fi


wget http://www.qsl.net/5b4az/pkg/apt/xwxapt/xwxapt-3.4.3.tar.bz2
tar jxvf xwxapt-3.4.3.tar.bz2
cd xwxapt-3.4.3
./autogen.sh
./configure
make install -j$(nproc)
ldconfig
EOF