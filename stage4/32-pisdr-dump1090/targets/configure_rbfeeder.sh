#!/bin/bash

# configure rbfeeder to use readsb

systemctl stop rb-feeder &>/dev/null

rm -f /etc/lighttpd/conf-enabled/89-dump1090.conf

apt-get remove -y dump1090-mutability &>/dev/null
apt-get remove -y dump1090 &>/dev/null
apt-get remove -y dump1090-fa &>/dev/null

if [[ -f /etc/rbfeeder.ini ]]; then
    if grep -qs -e 'network_mode=false' /etc/rbfeeder.ini &>/dev/null &&
        grep -qs -e 'mode=beast' /etc/rbfeeder.ini &&
        grep -qs -e 'external_port=30005' /etc/rbfeeder.ini &&
        grep -qs -e 'external_host=127.0.0.1' /etc/rbfeeder.ini
    then
        sed -i -e 's/network_mode=false/network_mode=true/' /etc/rbfeeder.ini
    fi
    systemctl restart rbfeeder &>/dev/null
fi
