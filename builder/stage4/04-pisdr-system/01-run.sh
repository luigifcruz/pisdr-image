install -m 755 shortcut/gnuradio.desktop "/home/${FIRST_USER_NAME}/Desktop"
install -m 755 shortcut/gqrx.desktop "/home/${FIRST_USER_NAME}/Desktop"
install -m 755 shortcut/sdrangel.desktop "/home/${FIRST_USER_NAME}/Desktop"

install -m 755 wallpaper/donald-giannatti-vla.jpg "${ROOTFS_DIR}/usr/share/rpd-wallpaper/"

on_chroot << EOF
pcmanfm --set-wallpaper ${ROOTFS_DIR}/usr/share/rpd-wallpaper/donald-giannatti-vla.jpg
EOF