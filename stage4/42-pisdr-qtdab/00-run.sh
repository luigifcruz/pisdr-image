#!/bin/bash -e



# Dont forget to update the desktop shortcut.



on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "qt-dab" ]; then
    git clone --single-branch --branch qt-dab-4.11 --depth 1 https://github.com/JvanKatwijk/qt-dab.git
fi

cd qt-dab/dab-maxi
mkdir -p build
cd build
cmake -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF