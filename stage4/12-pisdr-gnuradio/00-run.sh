#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "volk" ]; then
	git clone --single-branch --depth 1 --recurse-submodules --shallow-submodules https://github.com/luigifcruz/volk.git
fi

cd volk
mkdir -p build
cd build
cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
ninja install
ldconfig
cd ..
rm -fr build
EOF
