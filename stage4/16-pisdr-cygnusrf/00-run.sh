#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "CygnusRFI" ]; then
    git clone --depth 1 https://github.com/0xCoto/CygnusRFI
fi
EOF