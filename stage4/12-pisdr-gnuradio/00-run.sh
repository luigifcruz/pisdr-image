#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "volk" ]; then
	git clone --single-branch --branch v2.5.0 --depth 1 --recurse-submodules --shallow-submodules https://github.com/gnuradio/volk.git
fi

cd volk
mkdir -p build
cd build
cmake -DCMAKE_CXX_FLAGS:STRING="-march=armv8-a -Wno-psabi" \
      -DCMAKE_C_FLAGS:STRING="-march=armv8-a -Wno-psabi" \
	  DCMAKE_ASM_FLAGS:STRING="-march=armv8-a -Wno-psabi" \
	  -GNinja -DVOLK_CPU_FEATURES=OFF -DCMAKE_BUILD_TYPE=Release ..
ninja install
ldconfig
cd ..
rm -fr build
EOF
