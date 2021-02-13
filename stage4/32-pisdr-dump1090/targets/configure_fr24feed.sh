#!/bin/bash

# configure fr24feed to use readsb

systemctl stop fr24feed &>/dev/null

rm -f /etc/lighttpd/conf-enabled/89-dump1090.conf

apt-get remove -y dump1090-mutability &>/dev/null
apt-get remove -y dump1090 &>/dev/null
apt-get remove -y dump1090-fa &>/dev/null

if [ -f /etc/fr24feed.ini ]
then
	chmod a+rw /etc/fr24feed.ini
	cp -n /etc/fr24feed.ini /usr/local/share/adsb-wiki
	if ! grep host /etc/fr24feed.ini &>/dev/null; then sed -i -e '/fr24key/a host=' /etc/fr24feed.ini; fi
	sed -i -e 's/receiver=.*/receiver="beast-tcp"\r/' -e 's/host=.*/host="127.0.0.1:30005"\r/' -e 's/bs=.*/bs="no"\r/' -e 's/raw=.*/raw="no"\r/' /etc/fr24feed.ini
    systemctl restart fr24feed &>/dev/null
fi

if (( $(cat /etc/lighttpd/conf-enabled/* | grep -c -E -e '^server.stat-cache-engine *\= *"disable"') > 1 )); then
    rm -f /etc/lighttpd/conf-enabled/88-readsb-statcache.conf
fi

systemctl enable readsb
systemctl restart readsb
