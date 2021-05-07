#!/bin/bash

set -e

INPUT_DIR="$1"
TARGET_BOARD="$2"
IMAGE_NAME="$(basename $INPUT_DIR)"
TEGRA_DIR="$TARGET$BUILD/BSP_$TARGET_BOARD"

if [ $TARGET_BOARD == "AGX" ]; then
    L4T_ASSET="https://developer.download.nvidia.com/embedded/L4T/r32_Release_v4.4/r32_Release_v4.4-GMC3/T186/Tegra186_Linux_R32.4.4_aarch64.tbz2"
    IMG_NAMES=("jetson-xavier-nx-devkit")
    IMG_REVS=("default")
elif [ $TARGET_BOARD == "NANO" ]; then
    L4T_ASSET="https://developer.download.nvidia.com/embedded/L4T/r32_Release_v4.4/r32_Release_v4.4-GMC3/T210/Tegra210_Linux_R32.4.4_aarch64.tbz2"
    IMG_NAMES=("jetson-nano")
    IMG_REVS=("200")
fi

printf "Create Tegra directory... "
mkdir -p $TEGRA_DIR
printf "(OK)\n"

echo "Downloading Tegra assets..."
if [ ! "$(ls -A $TEGRA_DIR)" ]; then
    wget $L4T_ASSET 
    tar xpf $(basename $L4T_ASSET) -C $TEGRA_DIR
fi
echo "Downloading Tegra assets... (OK)"

printf "Copying rootfs assets... "
rm -fr $TEGRA_DIR/Linux_for_Tegra/rootfs/*
cp -rax $INPUT_DIR/. $TEGRA_DIR/Linux_for_Tegra/rootfs/
printf "(OK)\n"

printf "Ameliorate Tegra installer... "
rm -fr $TEGRA_DIR/Linux_for_Tegra/tools/python-jetson-gpio_2.0.11_arm64.deb
rm -fr $TEGRA_DIR/Linux_for_Tegra/nv_tegra/l4t_deb_packages/nvidia-l4t-oem-config*.deb
sed -i -e 's/ln -sf nv-oem-config.target default.target//g' \
    $TEGRA_DIR/Linux_for_Tegra/nv_tools/scripts/nv_customize_rootfs.sh
sed -i -e 's/dpkg -i/dpkg --force-overwrite -i/g' \
    $TEGRA_DIR/Linux_for_Tegra/nv_tegra/nv-apply-debs.sh
tar -jxvf $TEGRA_DIR/Linux_for_Tegra/nv_tegra/config.tbz2 \
    usr/lib/nvidia/resizefs/nvresizefs.sh \
    --one-top-level=$TEGRA_DIR/Linux_for_Tegra/rootfs/
printf "(OK)\n"

echo "Run pre application tasks..."
pushd $TARGET/ansible > /dev/null
export ANSIBLE_ROOTFS_DIR=$TEGRA_DIR/Linux_for_Tegra/rootfs
ansible-playbook -v 03_tegra.yaml --tags "pre"
echo "Run pre application tasks... (OK)"

echo "Applying Tegra binaries..."
pushd $TEGRA_DIR/Linux_for_Tegra/ > /dev/null
./apply_binaries.sh
echo "Applying Tegra binaries... (OK)"

echo "Run post application tasks..."
pushd $TARGET/ansible > /dev/null
export ANSIBLE_ROOTFS_DIR=$TEGRA_DIR/Linux_for_Tegra/rootfs
ansible-playbook -v 03_tegra.yaml --tags "post"
echo "Run post application tasks... (OK)"

for i in ${!IMG_NAMES[@]};
do
    BOARD=${IMG_NAMES[$i]}
    REV=${IMG_REVS[$i]}

    echo "Creating $BOARD image..."
    pushd $TEGRA_DIR/Linux_for_Tegra/ > /dev/null
    sudo ./tools/jetson-disk-image-creator.sh -o export.img -b $BOARD -r $REV
    mv $TEGRA_DIR/Linux_for_Tegra/export.img "${EXPORT_DIR}/${PISDR_IMG_NAME}-${IMAGE_NAME}-${BOARD}-${REV}.img" > /dev/null
    echo "Creating $BOARD image... (OK)"
done