#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/LimeSDR"
cd 		    "/home/${FIRST_USER_NAME}/LimeSDR"

if [ ! -d "LimeSuite" ]; then
    git clone https://github.com/myriadrf/LimeSuite.git
fi

cd LimeSuite
git pull
mkdir -p build
cd build
cmake -DCMAKE_CXX_LINK_FLAGS="$(DCMAKE_CXX_LINK_FLAGS) -latomic" ../
make -j$(nproc) install
ldconfig

cd ../udev-rules
./install.sh
EOF
