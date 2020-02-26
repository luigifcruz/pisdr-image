#!/bin/bash -e

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/Software"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/Radios/"

on_chroot << EOF
ln -sf "/home/${FIRST_USER_NAME}/PiSDR" "/home/${FIRST_USER_NAME}/Desktop/PiSDR"
EOF