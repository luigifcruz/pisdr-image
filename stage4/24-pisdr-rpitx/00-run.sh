#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "rpitx" ]; then
    git clone --depth 1 https://github.com/F5OEO/rpitx.git
fi
EOF