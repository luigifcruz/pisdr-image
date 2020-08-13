#!/bin/bash -e

install -m 755 patch/export.txt "${ROOTFS_DIR}/etc/"

on_chroot << EOF
cat /etc/export.txt >> /home/${FIRST_USER_NAME}/.bashrc
source /home/${FIRST_USER_NAME}/.bashrc
EOF
