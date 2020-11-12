#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "RTLSDR-Airband" ]; then
    git clone https://github.com/szpajder/RTLSDR-Airband.git
fi

cd RTLSDR-Airband
export PLATFORM=armv7-generic
export WITH_SOAPYSDR=1
make install
ldconfig
EOF