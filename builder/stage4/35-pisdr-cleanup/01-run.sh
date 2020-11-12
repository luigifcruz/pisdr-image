#!/bin/bash -e

on_chroot << EOF
chown pi:pi /etc/udev/rules.d/52-airspy.rules
chown pi:pi /etc/udev/rules.d/52-airspyhf.rules
chown pi:pi /etc/udev/rules.d/rtl-sdr.rules
chown pi:pi /lib/udev/rules.d/90-libiio.rules
chown pi:pi /etc/udev/rules.d/53-hackrf.rules
chown pi:pi /etc/udev/rules.d/uhd-usrp.rules
chown pi:pi /etc/udev/rules.d/64-limesuite.rules
udevadm control --reload-rules
udevadm trigger
EOF