#!/bin/bash -e

# currently not compiling with Bookworm
exit

on_chroot << EOF
python3 -m pip install --upgrade quisk
EOF