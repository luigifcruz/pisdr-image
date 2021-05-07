#!/bin/bash

set -e

printf "Copying base rootfs... "
cp -rax $HEADLESS_DIR/. $DESKTOP_DIR/
printf "(OK)\n"

echo "Run desktop installation tasks..."
pushd $TARGET/ansible > /dev/null
export ANSIBLE_ROOTFS_DIR=$DESKTOP_DIR
ansible-playbook -v 02_desktop.yaml
echo "Run desktop installation tasks... (OK)"