---
layout: default
title: Home
nav_order: 1
description: "The SDR Linux Distro for Raspberry Pi. Latest Software Defined Radio software pre-installed and ready to go."
permalink: /
---

# The SDR Linux Distro for Raspberry Pi
{: .fs-9 }

Modified Raspbian image with the latest SDR software pre-installed and ready to go. Compatible with every Raspberry Pi.
{: .fs-6 .fw-300 }

[Download Latest Version](#getting-started){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 } [View it on GitHub](https://github.com/luigifreitas/pisdr-image){: .btn .fs-5 .mb-4 .mb-md-0 }

---

The PiSDR is a Raspbian based operating system for the Raspberry Pi pre-loaded with multiple Software Defined Radio software. It was created to serve as a fast and reliable bootstrap for SDR projects.

---

## Documentation
This is a single person project with limited time and resources to acquire expensive SDRs. Only radios validated by tests are supported by this image. This is a limitation to maintain a certain level of quality. If you are a vendor and want your SDR supported by this image, consider donating one unit to the project.

### Software 
List of pre-installed software: SDR Angel, Soapy Remote, GQRX, GNURadio, LimeUtil, and LimeVNA.
#### Learn more [Pre-Installed Software](https://pisdr.luigifreitas.me/docs/software/software.html).

### Radios
We currently support the following SDRs: RTL-SDR, LimeSDR, PlutoSDR, Airspy, and Airspy HF.
#### Learn more [Supported Radios](https://pisdr.luigifreitas.me/docs/radios/radios.html).
 
### Computers
The latest version of the PiSDR supports every Raspberry Pi model (Zero, 1, 2, 3 and 4).
#### Learn more [Supported boards](https://pisdr.luigi.ltd/docs/computers/computers.html).

---

## Getting started

### Download
The download file is hosted on GitHub Releases. Click in the button below to start downloading your latest PiSDR image. No `.xz` extraction is required. Use this file directly with the flashing software.

[Download Latest Image]({{ site.github.latest_release.assets[0].browser_download_url }}){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }

### Installation
The installation process is the same as the vanilla Raspbian. You will need a MicroSD card with at least 8GB of capacity. To transfer the image file to the memory card we recommend the open-source and multi-platform [balenaEtcher](https://www.balena.io/etcher/) or the official [Raspberry Pi Imager](https://www.raspberrypi.org/blog/raspberry-pi-imager-imaging-utility/).

If you are feeling quite adventurous, you can copy the image to the memory card using `dd`. **Warning:** One should be extremely cautious using `dd`, as with any command of this kind it can destroy data irreversibly.
```bash
$ dd bs=4M if=pisdr.img of=/dev/sdX conv=fsync
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

---

## About the project

PiSDR Project was created and maintained since 2019 by [Luigi F. Cruz](https://luigi.ltd).

### Donation

Donations are welcome. This would help offset the development cost.
- [Patreon](https://www.patreon.com/luigifcruz)
- [PayPal](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=TAA65AJMC7498&source=url)

### Support

Feel free to hit me up on [Twitter](https://twitter.com/luigifcruz) or [Email](mailto:luigifcruz@gmail.com) if your question isn't answered by this documentation. If you found a bug, please, report it directly on [GitHub Issues](https://github.com/luigifreitas/pisdr-image/issues).

### License

PiSDR is distributed by an [MIT license](https://raw.githubusercontent.com/luigifreitas/pisdr-image/master/LICENSE).

### Disclaimer

This project isn't in any way associated with the Raspberry Pi Foundation. 

### Contributing

Everyone is very welcome to contribute to our project. Project icon made by [Smashicons](https://www.flaticon.com/authors/smashicons). 
