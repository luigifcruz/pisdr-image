#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "vaportrail" ]; then
    mkdir -p vaportrail
fi

cd vaportrail
wget https://github.com/inguardians/VaporTrail/releases/download/0.1.0/vaportrail-rpi2-and-rpi3.tar.gz
tar -xvzf vaportrail-rpi2-and-rpi3.tar.gz
cp vaportrail /usr/bin/
rm *.tar.gz
EOF