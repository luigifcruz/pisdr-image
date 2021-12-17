#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "LimeSuite" ]; then
    git clone --depth 1 https://github.com/myriadrf/LimeSuite.git
fi

cd LimeSuite
mkdir -p build
cd build
cmake -DCMAKE_CXX_FLAGS:STRING="-latomic -march=armv8-a -Wno-psabi" \
      -DCMAKE_C_FLAGS:STRING="-latomic -march=armv8-a -Wno-psabi" \
      -DENABLE_SIMD_FLAGS="foo" -GNinja -DCMAKE_BUILD_TYPE=Release ..
ninja install
ldconfig
cd ..
rm -fr build

cd udev-rules
./install.sh
EOF
