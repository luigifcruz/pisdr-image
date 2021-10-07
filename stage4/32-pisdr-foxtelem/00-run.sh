#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "FoxTelem" ]; then
    wget http://amsat.us/FoxTelem/linux/FoxTelem_1.11g2_linux.tar.gz
    tar -xvzf  FoxTelem_1.08z5_linux.tar.gz
    mv FoxTelem_1.08z5_linux FoxTelem
fi
EOF
