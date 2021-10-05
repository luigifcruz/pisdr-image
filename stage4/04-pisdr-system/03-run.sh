#!/bin/bash -e

on_chroot << EOF
python3 -m pip install cmake
python3 -m pip install ninja
python3 -m pip install pybind11
EOF
