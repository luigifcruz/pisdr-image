#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "gnuradio" ]; then
    git clone --recursive https://github.com/gnuradio/gnuradio.git
fi

cd gnuradio
git checkout maint-3.8
git submodule update --init --recursive
mkdir -p build
cd build
echo 'export PYTHONPATH=/usr/local/lib/python3/dist-packages:$PYTHONPATH' >> ~/.bashrc
cmake -GNinja -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ..
ninja install
ldconfig
EOF

