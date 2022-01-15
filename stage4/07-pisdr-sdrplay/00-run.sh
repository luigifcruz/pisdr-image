#!/bin/bash -e

on_chroot << EOF
mkdir -p 	"/home/${FIRST_USER_NAME}/PiSDR/Radios"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Radios"

if [ ! -d "sdrplay" ]; then
    mkdir -p sdrplay
fi

cd sdrplay
wget https://www.sdrplay.com/software/SDRplay_RSP_API-ARM64-3.07.1.run
chmod +x ./SDRplay_RSP_API-ARM64-3.07.1.run
./SDRplay_RSP_API-ARM64-3.07.1.run --check
./SDRplay_RSP_API-ARM64-3.07.1.run --noexec --target .
sed -i 's/more sdrplay_license.txt//g' install_lib.sh
sed -i 's/ARCH=\`uname -m\`/ARCH=arm64/g' install_lib.sh
printf "\ny\ny\ny\n" | ./install_lib.sh
systemctl enable sdrplay
ldconfig
EOF