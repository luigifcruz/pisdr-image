#!/bin/bash -e

on_chroot << EOF
python3 -m pip install --upgrade quisk
EOF