---
layout: default
title: PlutoSDR
parent: Radios
nav_order: 7
---

# PlutoSDR
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Software Defined Radio with a built-in ARM core based on the Xilinx Zync-7000 featuring the AD936x as the RF transceiver.

## Specifications

| Specification   | Value           |
|:----------------|:----------------|
| Frequency Range | 325 - 3800 MHz  |
| Bandwidth       | Up to 20 Msps (Stable) |
| ADC Resolution  | 12-bits         |
| USB Speed       | 2.0             |
| TX Mode         | Yes             |
| Bias-T          | No              |

## Device Fingerprint
```bash
$ lsusb
Bus 001 Device 005: ID 0456:b673 Analog Devices, Inc. PlutoSDR (ADALM-PLUTO)
```

## Firmware Sources
```
https://github.com/analogdevicesinc/libiio
https://github.com/analogdevicesinc/libad9361-iio
https://github.com/analogdevicesinc/gr-iio
```

## Supported Software
- GQRX 
- SDRAngel
- GNURadio
- Soapy Remote

## Command Line Tools
- iio_readdev
- iio_info