#!/bin/bash -e

on_chroot << EOF
python3 -m pip -v install cmake
python3 -m pip -v install ninja
EOF
