#!/bin/bash

cd /usr/local/share/adsb-wiki/readsb-install

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

rm -fr /usr/local/share/tar1090/git-db
rm -fr /usr/local/share/tar1090/git