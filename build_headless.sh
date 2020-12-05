#!/bin/bash

set -e

printf "Copying base rootfs... "
cp -rp $BASE_DIR/. $HEADLESS_DIR/
printf "(OK)\n"

echo "Run headless installation tasks..."
pushd $TARGET/ansible > /dev/null
export ANSIBLE_ROOTFS_DIR=$HEADLESS_DIR
ansible-playbook -v 01_headless.yaml
echo "Run headless installation tasks... (OK)"