#!/bin/bash -e

on_chroot << EOF
sudo ln -s /usr/local/lib/python3/dist-packages/* /usr/lib/python3/dist-packages || true
EOF