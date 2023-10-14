#!/bin/bash -e

on_chroot << EOF
mkdir -p    "/home/${FIRST_USER_NAME}/PiSDR/Software"
cd 		    "/home/${FIRST_USER_NAME}/PiSDR/Software"

if [ ! -d "SDRPlusPlus" ]; then
    git clone --single-branch --branch master --depth 1 https://github.com/AlexandreRouma/SDRPlusPlus.git
fi

cd SDRPlusPlus
bash ./create_root.sh
mkdir -p build
cd build
cmake -DOPT_BUILD_AIRSPY_SOURCE=ON \
      -DOPT_BUILD_AIRSPYHF_SOURCE=ON \
      -DOPT_BUILD_FILE_SOURCE=ON \
      -DOPT_BUILD_HACKRF_SOURCE=ON \
      -DOPT_BUILD_LIMESDR_SOURCE=ON \
      -DOPT_BUILD_RTL_SDR_SOURCE=ON \
      -DOPT_BUILD_RTL_TCP_SOURCE=ON \
      -DOPT_BUILD_SDRPLAY_SOURCE=ON \
      -DOPT_BUILD_SOAPY_SOURCE=ON \
      -DOPT_BUILD_SPYSERVER_SOURCE=ON \
      -DOPT_BUILD_PLUTOSDR_SOURCE=ON \
      -DOPT_BUILD_AUDIO_SINK=ON \
      -DOPT_BUILD_NETWORK_SINK=ON \
      -DOPT_BUILD_NEW_PORTAUDIO_SINK=ON \
      -DOPT_BUILD_M17_DECODER=ON \
      -DOPT_BUILD_METEOR_DEMODULATOR=ON \
      -DOPT_BUILD_RADIO=ON \
      -DOPT_BUILD_DISCORD_PRESENCE=ON \
      -DOPT_BUILD_FREQUENCY_MANAGER=ON \
      -DOPT_BUILD_RECORDER=ON \
      -DOPT_BUILD_RIGCTL_SERVER=ON \
      -GNinja ..
ninja install
ldconfig
cd ..
rm -fr build
EOF