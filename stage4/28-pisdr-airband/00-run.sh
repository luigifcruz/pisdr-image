#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "RTLSDR-Airband" ]; then
    git clone --branch unstable --depth 1 https://github.com/szpajder/RTLSDR-Airband.git
fi

cd RTLSDR-Airband
export PLATFORM=armv8-generic
export WITH_SOAPYSDR=1
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF