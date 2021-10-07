#!/bin/bash -e

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/Software/dump1090/"
install -v -o 1000 -g 1000 -m 755 targets/enable.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/Software/dump1090/"
install -v -o 1000 -g 1000 -m 755 targets/disable.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/Software/dump1090/"
install -v -o 1000 -g 1000 -m 755 targets/configure_rbfeeder.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/Software/dump1090/"
install -v -o 1000 -g 1000 -m 755 targets/configure_fr24feed.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/Software/dump1090/"

install -v -o 1000 -g 1000 -m 755 targets/readsb-set-location "${ROOTFS_DIR}/usr/local/bin/"
install -v -o 1000 -g 1000 -m 755 targets/readsb-gain "${ROOTFS_DIR}/usr/local/bin/"

on_chroot << EOF
cd "/home/${FIRST_USER_NAME}/PiSDR/Software/dump1090"

mkdir -p /usr/local/share/adsb-wiki/readsb-install

apt-get update
apt-get install --no-install-recommends --no-install-suggests -y git build-essential debhelper libusb-1.0-0-dev \
    pkg-config dh-systemd libncurses5-dev lighttpd zlib1g-dev zlib1g unzip

rm -rf /usr/local/share/adsb-wiki/readsb-install/git
if ! git clone --branch stale --depth 1 https://github.com/wiedehopf/readsb.git "/usr/local/share/adsb-wiki/readsb-install/git"
then
    echo "Unable to git clone the repository"
    exit 1
fi

rm -rf /usr/local/share/adsb-wiki/readsb-install/readsb*.deb

cd /usr/local/share/adsb-wiki/readsb-install/git

export DEB_BUILD_OPTIONS=noddebs
if ! dpkg-buildpackage -d -b -Prtlsdr -ui -uc -us
then
    echo "Something went wrong building the debian package, exiting!"
    exit 1
fi

echo "Installing the Package"
if ! dpkg --force-all -i ../readsb_*.deb
then
    echo "Something went wrong installing the debian package, exiting!"
    exit 1
fi
echo "Package installed!"

cp -n debian/lighttpd/* /etc/lighttpd/conf-available

echo "[PiSDR] Disabling services. To enable them, run 'bash enable.sh'."

systemctl disable --now readsb || true
systemctl disable --now tar1090 || true
systemctl disable --now lighttpd || true

EOF
