#!/bin/bash -e

on_chroot << EOF
python2 -m pip install --upgrade quisk
python3 -m pip install --upgrade quisk
EOF