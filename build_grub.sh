#!/bin/bash

set -e

INPUT_DIR="$1"
IMAGE_NAME="$(basename $INPUT_DIR)"
GRUB_IMG="$TARGET$BUILD/export.img"
GRUB_DIR="$TARGET$BUILD/grub"
LOOP_DEV="/dev/loop5"

printf "Creating image file... "
if [ "$(lsblk | grep $(basename $LOOP_DEV))" ]; then
    losetup -d $LOOP_DEV || true
fi
rm -fr $GRUB_IMG
printf "(OK)\n"

echo "Allocating image file..."
if [ -f $GRUB_IMG ]; then
    rm -fr $GRUB_IMG
fi
qemu-img create $GRUB_IMG 10G
parted -s -a optimal -- $GRUB_IMG \
    mklabel gpt \
    mkpart primary fat32 1MiB 270MiB \
    mkpart primary ext4 1GiB -0 \
    name 1 uefi \
    name 2 root \   
    set 1 esp on
losetup --partscan $LOOP_DEV $GRUB_IMG
partprobe $LOOP_DEV
echo "Allocating image file... (OK)"

printf "Find partitions UUID... "
ROOT_UUID=$(blkid | grep "^$LOOP_DEV" | grep ' PARTLABEL="root" ' | grep -o ' PARTUUID="[^"]\+"' | sed -e 's/^ //' )
EFI_UUID=$(blkid | grep "^$LOOP_DEV" | grep ' PARTLABEL="uefi" ' | grep -o ' PARTUUID="[^"]\+"' | sed -e 's/^ //' )
printf "(OK)\n"

echo "Formatting image file..."
mkfs -t vfat -F 32 -n EFI ${LOOP_DEV}p1
mkfs -t ext4 -L root ${LOOP_DEV}p2
echo "Formatting image file... (OK)"

printf "Mounting root filesystem... "
if [ -d "$GRUB_DIR" ]; then
    umount -q $GRUB_DIR || true
    rm -fr $GRUB_DIR
fi
mkdir -p $GRUB_DIR
mount $ROOT_UUID $GRUB_DIR
printf "(OK)\n"

printf "Copying filesystem to image... "
cp -rp $INPUT_DIR/. $GRUB_DIR/
printf "(OK)\n"

printf "Mounting efi filesystem... "
if [ -d "$GRUB_DIR/boot/efi" ]; then
    umount -q $GRUB_DIR/boot/efi || true
    rm -fr $GRUB_DIR/boot/efi
fi
mkdir -p $GRUB_DIR/boot/efi
mount $EFI_UUID $GRUB_DIR/boot/efi
printf "(OK)\n"

echo "Run GRUB installation tasks..."
pushd $TARGET/ansible > /dev/null
export ANSIBLE_ROOTFS_DIR=$GRUB_DIR
ansible-playbook -v 03_grub.yaml
echo "Run GRUB installation tasks... (OK)"

printf "Installing fstab... "
echo "$ROOT_UUID / ext4 errors=remount-ro 0 1" > $GRUB_DIR/etc/fstab
echo "$EFI_UUID /boot/efi vfat defaults 0 1" >> $GRUB_DIR/etc/fstab
printf "(OK)\n"

printf "Umounting everything... "
umount -q $GRUB_DIR/boot/efi
umount -q $GRUB_DIR
printf "(OK)\n"

echo "Checking filesystem..."
fsck -y ${LOOP_DEV}p2
echo "Checking filesystem... (OK)"

echo "Detaching loop device..."
losetup -d $LOOP_DEV
echo "Detaching loop device... (OK)"

printf "Moving export image file... "
mv $GRUB_IMG "${EXPORT_DIR}/${PISDR_IMG_NAME}-${IMAGE_NAME}-amd64.img" > /dev/null
printf "(OK)\n"