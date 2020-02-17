#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"${ROOTFS_DIR}/home/${FIRST_USER_NAME}/LimeSDR"
cd 		    "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/LimeSDR"

if [ ! -d "LimeSuite" ]; then
    git clone https://github.com/myriadrf/LimeSuite.git
fi

cd LimeSuite
git pull
mkdir -p build
cd build
rm -rf CMakeCache.txt
cmake -DENABLE_SPI=ON -DCMAKE_CXX_LINK_FLAGS="$(DCMAKE_CXX_LINK_FLAGS) -latomic" ../
make -j$(nproc)
make install
ldconfig

cd ..
./udev-rules/install.sh
EOF
