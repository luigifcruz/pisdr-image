#!/bin/bash -e

on_chroot << EOF
python3 -m pip install cmake
python3 -m pip install ninja
EOF
