install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/"
install -v -o 1000 -g 1000 -m 755 shortcut/gnuradio.desktop "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/"
install -v -o 1000 -g 1000 -m 755 shortcut/gqrx.desktop "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/"
install -v -o 1000 -g 1000 -m 755 shortcut/sdrangel.desktop "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/"
install -v -o 1000 -g 1000 -m 755 shortcut/gpredict.desktop "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/Desktop/"

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/usr/share/rpd-wallpaper/"
install -v -o 1000 -g 1000 -m 755 wallpaper/donald-giannatti-vla.jpg "${ROOTFS_DIR}/usr/share/rpd-wallpaper/"

install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/menus/"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/pcmanfm/"
install -v -o 1000 -g 1000 -d "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/pcmanfm/LXDE-pi/"

install -v -o 1000 -g 1000 -m 644 wallpaper/desktop-items-0.conf "${ROOTFS_DIR}/home/${FIRST_USER_NAME}/.config/pcmanfm/LXDE-pi/"