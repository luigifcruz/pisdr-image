#!/bin/bash -e

# currently not compiling with latest AirSpy drivers
exit

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "urh" ]; then
    git clone --depth 1 --branch v2.9.4 https://github.com/jopohl/urh.git
fi

cd urh
python3 -m pip install cython==3.0.0
python3 setup.py install
EOF