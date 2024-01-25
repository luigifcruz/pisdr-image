#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "rtl-sdr-blog" ]; then
    git clone --depth 1 https://github.com/rtlsdrblog/rtl-sdr-blog.git
fi

cd rtl-sdr-blog
mkdir -p build
cd build
cmake -GNinja -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON ..
ninja install
ldconfig
cd ..
rm -fr build
EOF
