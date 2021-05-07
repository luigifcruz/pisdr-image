#!/bin/bash

set -e

##############################################################

#### Image Settings
export PISDR_RELEASE="focal"
export PISDR_USER="pi"
export PISDR_PASS="raspberry"
export PISDR_IMG_NAME="$(date '+%Y-%m-%d')-PiSDR-$PISDR_ARCH"

#### Build Settings
BUILD_BOARD_TEGRA_NANO=true
BUILD_BOARD_TEGRA_AGX=false
BUILD_BOARD_RPI=false
BUILD_BOARD_GRUB=false

#### Compiler Settings
export TARGET="/target"
export BUILD="/build/$PISDR_ARCH"
export BASE_DIR="$TARGET$BUILD/base"
export DESKTOP_DIR="$TARGET$BUILD/desktop"
export HEADLESS_DIR="$TARGET$BUILD/headless"
export EXPORT_DIR="$TARGET/export"

##############################################################

printf "Validating pipeline configuration... "
if [ "$PISDR_ARCH" != "amd64" ] && [ "$PISDR_ARCH" != "arm64" ]; then
    printf "(NOK)\n"
    echo "Invalid PISDR_ARCH environment variable. Choose between amd64 and arm64."
    exit
fi
printf "(OK)\n"

printf "Re-seeding export directory... "
rm -fr $EXPORT_DIR
mkdir -p $EXPORT_DIR
printf "(OK)\n"

##############################################################

#### Phase 00
( $TARGET/build_base.sh )

#### Phase 01
( $TARGET/build_headless.sh )

#### Phase 02
( $TARGET/build_desktop.sh )

#### Phase 03
if [[ "$PISDR_ARCH" == "arm64" ]]; then
    if [[ "$BUILD_BOARD_TEGRA_AGX" == true ]]; then
        ( $TARGET/build_tegra.sh $HEADLESS_DIR "AGX" )
        ( $TARGET/build_tegra.sh $DESKTOP_DIR "AGX" )
    fi

    if [[ "$BUILD_BOARD_TEGRA_NANO" == true ]]; then
        ( $TARGET/build_tegra.sh $HEADLESS_DIR "NANO" )
        ( $TARGET/build_tegra.sh $DESKTOP_DIR "NANO" )
    fi

    if [[ "$BUILD_BOARD_RPI" == true ]]; then
        ( $TARGET/build_rpi.sh $HEADLESS_DIR )
        ( $TARGET/build_rpi.sh $DESKTOP_DIR )
    fi
fi

if [[ "$PISDR_ARCH" == "amd64" ]]; then
    if [[ "$BUILD_BOARD_GRUB" == true ]]; then
        ( $TARGET/build_grub.sh $HEADLESS_DIR )
        ( $TARGET/build_grub.sh $DESKTOP_DIR )
    fi
fi
