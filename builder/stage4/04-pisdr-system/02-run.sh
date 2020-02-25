#!/bin/bash -e

on_chroot << EOF
mkdir -p "/home/${FIRST_USER_NAME}/PiSDR"
ln -sf "/home/${FIRST_USER_NAME}/PiSDR" PiSDR

mkdir -p "/home/${FIRST_USER_NAME}/PiSDR/Software"
mkdir -p "/home/${FIRST_USER_NAME}/PiSDR/Radios"
EOF