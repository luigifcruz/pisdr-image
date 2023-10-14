# 🥧 PiSDR: The SDR Linux Distro for Your Pi
#### Modified Raspbian image with the latest SDR software pre-installed and ready to go. Compatible with every Pi.

[![Github All Downloads](https://img.shields.io/github/downloads/luigifreitas/pisdr-image/total)]()
[![Github Latest Version](https://img.shields.io/github/v/release/luigifreitas/pisdr-image)]()

The PiSDR is a Raspbian based operating system for the Pi pre-loaded with multiple Software Defined Radio software. It was created to serve as a fast and reliable bootstrap for SDR projects.

## Documentation
This is a single person project with limited time and resources to acquire expensive SDRs. Only radios validated by tests are supported by this image. This is a limitation to maintain a certain level of quality. If you are a vendor and want your SDR supported by this image, consider donating one unit to the project. The latest version of the PiSDR supports every Raspberry Pi model (Zero, 1, 2, 3 and 4).

### Software 
List of pre-installed software:
- [UHD](https://github.com/EttusResearch/uhd/tree/UHD-3.15.LTS)
- [GQRX](https://github.com/csete/gqrx)
- [GNURadio](https://github.com/gnuradio/gnuradio)
- [LimeVNA](https://github.com/myriadrf/pyLMS7002Soapy)
- [Soapy Remote](https://github.com/pothosware/SoapyRemote)
- [Soapy](https://github.com/pothosware/SoapySDR)
- [SDR Angel](https://github.com/f4exb/sdrangel)
- [LimeSuite](https://github.com/myriadrf/LimeSuite)
- [RTLSDR-Airband](https://github.com/szpajder/RTLSDR-Airband)
- [LimeSDR_toolbox](https://github.com/emvivre/limesdr_toolbox)
- [osmo-fl2k](https://osmocom.org/projects/osmo-fl2k/wiki)
- [hamlib](https://hamlib.github.io/)
- [VaporTrail](https://github.com/inguardians/VaporTrail)
- [Universal Radio Hacker](https://github.com/jopohl/urh)
- [Quisk](http://james.ahlstrom.name/quisk/)
- [0xCoto/VIRGO](https://github.com/0xCoto/VIRGO)
- [0xCoto/CygnusRFI](https://github.com/0xCoto/CygnusRFI)
- [F5OEO/rpitx](https://github.com/F5OEO/rpitx)
- [merbanan/rtl_433](https://github.com/merbanan/rtl_433)
- [TLeconte/acarsdec](https://github.com/TLeconte/acarsdec)
- [gpredict](https://github.com/csete/gpredict)
- [EliasOenal/multimon-ng](https://github.com/EliasOenal/multimon-ng)
- [pabr/leansdr](https://github.com/pabr/leansdr)
- [QtDAB](https://github.com/JvanKatwijk/qt-dab)
- [IIO Oscilloscope](https://github.com/analogdevicesinc/iio-oscilloscope)
- [RTL-AIS](https://github.com/dgiardini/rtl-ais)
- [Inspectrum](https://github.com/miek/inspectrum)
- [WSJT-X](https://physics.princeton.edu/pulsar/k1jt/wsjtx.html)
- [nrsc5](https://github.com/theori-io/nrsc5)
- [xwxapt](https://www.qsl.net/5b4az/pkg/apt/xwxapt/xwxapt.html)
- [GLRPT](https://github.com/dvdesolve/glrpt)
- [SDR++](https://github.com/AlexandreRouma/SDRPlusPlus)

### Radios
We currently support the following SDR:
- [RTL-SDR](https://www.rtl-sdr.com/about-rtl-sdr/)
- [LimeSDR USB](https://wiki.myriadrf.org/LimeSDR-USB)
- [LimeSDR Mini](https://wiki.myriadrf.org/LimeSDR-Mini)
- [LimeNET Micro](https://wiki.myriadrf.org/LimeNET_Micro)
- [PlutoSDR](https://wiki.analog.com/university/tools/pluto)
- [Airspy R2](https://airspy.com/airspy-r2)
- [Airspy Mini](https://airspy.com/airspy-mini/)
- [Airspy HF Discovery](https://airspy.com/airspy-hf-discovery)
- [Airspy HF+](https://airspy.com/airspy-hf-plus/)
- [HackRF One](https://greatscottgadgets.com/hackrf/one/)
- [USRP](https://www.ettus.com/products/)
- [SDRplay](https://www.sdrplay.com/)

## Getting started

### Download
The download file is hosted on GitHub Releases. Click in the button below to go to the latest release and choose the `.tar.xz` file to start downloading your PiSDR image. No `.xz` extraction is required. Use this file directly with the flashing software.

[Download Latest Image](https://github.com/luigifcruz/pisdr-image/releases/latest)

### Installation
The installation process is the same as the vanilla Raspbian. You will need a MicroSD card with at least 8GB of capacity. To transfer the image file to the memory card we recommend the open-source and multi-platform [balenaEtcher](https://www.balena.io/etcher/) or the official [Raspberry Pi Imager](https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility/).

If you are feeling quite adventurous, you can copy the image to the memory card using `dd`. **Warning:** One should be extremely cautious using `dd`, as with any command of this kind it can destroy data irreversibly.
```bash
$ dd bs=4M if=pisdr.img of=/dev/sdX conv=fsync
```

### Post Installation (Recommended)
When running your PiSDR installation for the first time, it's recommended to run the following command in the target board. This command will enable math optimizations supported by your hardware and speedup programs like GNU Radio and GQRX.

```bash
volk_profile
```

### Usage
This image can be used as a standard Raspbian desktop environment. The HDMI Output, SSH, and Remote VNC are enabled by default. For usage information about any pre-installed software, please refer to our [Software Page](https://pisdr.luigi.ltd/docs/software/software/index).

**Warning: It is important to change the credentials after the first login to ensure your security.**

#### SSH
To access the system with this option, you will need an SSH client. This is built-in inside the Command-Line of most operating systems (Linux, macOS and Windows 10). As a GUI alternative, we recommend using the PuTTY application available for Linux and Windows.

```bash
$ ssh pi@pisdr.local
Password: raspberry
```

#### VNC
The remote desktop can be accessed using any VNC client. The credentials are the same from the SSH. The default screen resolution is set to 720p. This setting can be easily changed inside the `raspi-config` menu (Advanced > Resolution).  _Note: The Remmina Client is known to be incompatible with this VNC Server._

#### Running Programs
Not all programs listed above will be listed on the desktop. Most of them require to be launched from the terminal. Please, refer to the documentation of the program that you would like to use for launch instructions. The `README.md` files can also be accessed offline inside the `/home/pi/PiSDR` directory.

## Advanced

You can also choose to compile PiSDR on your own. However, be aware that this process can take several hours, depending on your hardware. It's important to note that standard x86 machines, such as those with Intel and AMD CPUs, will typically take much longer. This is because they have to emulate an ARM64 processor to compile everything. In contrast, machines with native ARM64 processors, like Apple Silicon and Ampere, will be significantly faster as they don't require emulation.

This project uses docker to compile the images.

#### macOS (Colima)
```bash
$ colima start --cpu 8 --cpu-type cortex-a72 --memory 14 --arch aarch64
```

## About the project
PiSDR Project was created and maintained since 2019 by [Luigi F. Cruz](https://luigi.ltd).

### Support
Feel free to hit me up on [Twitter](https://twitter.com/luigifcruz) or [Email](mailto:luigifcruz@gmail.com) if your question isn't answered by this documentation. If you found a bug, please, report it directly on [GitHub Issues](https://github.com/luigifreitas/pisdr-image/issues).

### Hardware Sponsors
- Airspy R2 and AirspyHF Discovery: Provided by [@lambdaprog](https://twitter.com/lambdaprog).
- LimeSDR Mini, LimeSDR RFE, and LimeSDR USB: Provided by [MyriadRF](https://myriadrf.org/).
- RTL-SDR and Airspy Mini: Provided by [@lucasteske](https://twitter.com/lucasteske).
- SDRplay RSP1A: Provided by [SDRPlay](https://www.sdrplay.com/).
- PlutoSDR: Provided by [Analog Devices](https://www.analog.com/en/design-center/evaluation-hardware-and-software/evaluation-boards-kits/adalm-pluto.html).

### License
PiSDR is distributed by an [MIT license](https://raw.githubusercontent.com/luigifreitas/pisdr-image/master/LICENSE).

### Disclaimer
This project isn't in any way associated with the Raspberry Pi Foundation.

### Contributing
Everyone is very welcome to contribute to our project. Project icon made by [Smashicons](https://www.flaticon.com/authors/smashicons).
