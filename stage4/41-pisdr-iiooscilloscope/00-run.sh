#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "iio-oscilloscope" ]; then
    git clone --depth 1 https://github.com/analogdevicesinc/iio-oscilloscope.git
fi

cd iio-oscilloscope
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF