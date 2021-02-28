#!/bin/bash -e

install -v -o 1000 -g 1000 -m 755 targets/enable.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/Software/dump1090/"
install -v -o 1000 -g 1000 -m 755 targets/disable.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/Software/dump1090/"
install -v -o 1000 -g 1000 -m 755 targets/configure_rbfeeder.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/Software/dump1090/"
install -v -o 1000 -g 1000 -m 755 targets/configure_fr24feed.sh "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/PiSDR/Software/dump1090/"

on_chroot << EOF
cd "/home/${FIRST_USER_NAME}/PiSDR/Software/dump1090"

repository="https://github.com/wiedehopf/readsb.git"

apt-get update
apt-get install --no-install-recommends --no-install-suggests -y git build-essential debhelper libusb-1.0-0-dev \
    pkg-config dh-systemd libncurses5-dev lighttpd zlib1g-dev zlib1g unzip

rm -rf "$ipath"/git
if ! git clone --branch stale --depth 1 "$repository" "$ipath/git"
then
    echo "Unable to git clone the repository"
    exit 1
fi

rm -rf "$ipath"/readsb*.deb

cd "$ipath/git"

sed -i 's/librtlsdr0, librtlsdr-dev, //g' debian/control

export DEB_BUILD_OPTIONS=noddebs
if ! dpkg-buildpackage -b -Prtlsdr -ui -uc -us
then
    echo "Something went wrong building the debian package, exiting!"
    exit 1
fi

echo "Installing the Package"
if ! dpkg -i ../readsb_*.deb
then
    echo "Something went wrong installing the debian package, exiting!"
    exit 1
fi
echo "Package installed!"

cp -n debian/lighttpd/* /etc/lighttpd/conf-available

# script to change gain

mkdir -p /usr/local/bin
cat >/usr/local/bin/readsb-gain <<"EOF"
#!/bin/bash
gain=$(echo $1 | tr -cd '[:digit:].-')
if [[ $gain == "" ]]; then echo "Error, invalid gain!"; exit 1; fi
if ! grep gain /etc/default/readsb &>/dev/null; then sed -i -e 's/RECEIVER_OPTIONS="/RECEIVER_OPTIONS="--gain 49.6 /' /etc/default/readsb; fi
sudo sed -i -E -e "s/--gain .?[0-9]*.?[0-9]* /--gain $gain /" /etc/default/readsb
sudo systemctl restart readsb
EOF
chmod a+x /usr/local/bin/readsb-gain

# set-location
cat >/usr/local/bin/readsb-set-location <<"EOF"
#!/bin/bash

lat=$(echo $1 | tr -cd '[:digit:].-')
lon=$(echo $2 | tr -cd '[:digit:].-')

if ! awk "BEGIN{ exit ($lat > 90) }" || ! awk "BEGIN{ exit ($lat < -90) }"; then
	echo
	echo "Invalid latitude: $lat"
	echo "Latitude must be between -90 and 90"
	echo
	echo "Example format for latitude: 51.528308"
	echo
	echo "Usage:"
	echo "readsb-set-location 51.52830 -0.38178"
	echo
	exit 1
fi
if ! awk "BEGIN{ exit ($lon > 180) }" || ! awk "BEGIN{ exit ($lon < -180) }"; then
	echo
	echo "Invalid longitude: $lon"
	echo "Longitude must be between -180 and 180"
	echo
	echo "Example format for latitude: -0.38178"
	echo
	echo "Usage:"
	echo "readsb-set-location 51.52830 -0.38178"
	echo
	exit 1
fi

echo
echo "setting Latitude: $lat"
echo "setting Longitude: $lon"
echo
if ! grep -e '--lon' /etc/default/readsb &>/dev/null; then sed -i -e 's/DECODER_OPTIONS="/DECODER_OPTIONS="--lon -0.38178 /' /etc/default/readsb; fi
if ! grep -e '--lat' /etc/default/readsb &>/dev/null; then sed -i -e 's/DECODER_OPTIONS="/DECODER_OPTIONS="--lat 51.52830 /' /etc/default/readsb; fi
sed -i -E -e "s/--lat .?[0-9]*.?[0-9]* /--lat $lat /" /etc/default/readsb
sed -i -E -e "s/--lon .?[0-9]*.?[0-9]* /--lon $lon /" /etc/default/readsb
systemctl restart readsb
EOF
chmod a+x /usr/local/bin/readsb-set-location

echo --------------
cd "$ipath"

wget -O tar1090-install.sh https://raw.githubusercontent.com/wiedehopf/tar1090/master/install.sh
bash tar1090-install.sh /run/readsb

if ! systemctl show readsb | grep 'ExecMainStatus=0' -qs; then
    echo --------------
    echo --------------
    journalctl -u readsb | tail -n30
    echo --------------
    echo --------------
    echo "ERROR: readsb service didn't start, if inquiring about the issue please post the above 30 lines of log!"
    echo "       common issues: SDR not plugged in."
    echo "       the webinterface will show an error until readsb is running!"
    echo --------------
fi

echo --------------

echo "[PiSDR] Disabling services. To enable them, run 'bash enable.sh'."

systemctl disable --now readsb
systemctl disable --now tar1090
systemctl disable --now lighttpd

echo "[PiSDR] Deleting build files to save space."

rm -fr /usr/local/share/tar1090/git-db
rm -fr /usr/local/share/tar1090/git

EOF