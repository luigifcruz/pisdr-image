#!/bin/bash

set -e

printf "Create base rootfs directory... "
mkdir -p $BASE_DIR
printf "(OK)\n"

printf "Enabling qemu kernel components... "
update-binfmts --enable qemu-arm > /dev/null 2>&1
if [ ! "$(ls -A /proc/sys/fs/binfmt_misc/)" ]; then
    printf "(NOK)\n"
    exit
fi
printf "(OK)\n"

echo "Run debootstrap first stage..."
if [ ! -f "${BASE_DIR}/.bootstrap_completed" ]; then
    qemu-debootstrap \
        --arch=$PISDR_ARCH \
        --variant=minbase \
        --no-merged-usr \
        --force-check-gpg \
        --keyring /usr/share/keyrings/ubuntu-archive-keyring.gpg \
        --include=python3,libegl1,python3-apt \
        $PISDR_RELEASE \
        $BASE_DIR
    touch $BASE_DIR/.bootstrap_completed
fi
echo "Run debootstrap first stage... (OK)"

echo "Run base installation..."
cd $TARGET/ansible
export ANSIBLE_ROOTFS_DIR=$BASE_DIR
ansible-playbook -v 00_base.yaml
echo "Run base installation... (OK)"