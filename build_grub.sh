#!/bin/bash

set -e

INPUT_DIR="$1"
IMAGE_NAME="$(basename $INPUT_DIR)"
GRUB_DIR="$TARGET$BUILD/grub"

printf "Copying base rootfs... "
rm -fr $GRUB_DIR
cp -rp $INPUT_DIR/. $GRUB_DIR/
printf "(OK)\n"

echo "Run GRUB installation tasks..."
pushd $TARGET/ansible > /dev/null
export ANSIBLE_ROOTFS_DIR=$GRUB_DIR
ansible-playbook -v 03_grub.yaml
echo "Run GRUB installation tasks... (OK)"