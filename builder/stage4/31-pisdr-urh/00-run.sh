#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "urh" ]; then
    git clone https://github.com/jopohl/urh.git
fi

cd urh
python3 -m pip install --upgrade cython
python3 setup.py install
EOF