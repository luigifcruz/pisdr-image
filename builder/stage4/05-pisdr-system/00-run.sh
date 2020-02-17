#!/bin/bash -e

on_chroot << EOF
## Turn on VNC
systemctl enable vncserver-x11-serviced.service
EOF