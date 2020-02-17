---
layout: default
title: LimeSDR USB
parent: Radios
nav_order: 6
---

# LimeSDR USB
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

More capable version of the LimeSDR Mini with double the specifications. More information about this device can be found on the [Myriad Wiki](https://wiki.myriadrf.org/LimeSDR-USB). 

## Specifications

| Specification   | Value           |
|:----------------|:----------------|
| Frequency Range | 100 kHz - 3.8 GHz   |
| Bandwidth       | Up to   61.44 Msps (Stable) |
| ADC Resolution  | 12-bits         |
| USB Speed       | 3.0 (CYUSB3014) |
| TX Mode         | Yes             |
| Duplex          | Full (2x2 MIMO)  |
| Crystal         | Rakon TCXO (4.0 ppm stable) |
| Bias-T          | No              |

## Device Fingerprint
```bash
$ lsusb
Bus 020 Device 010: ID 1d50:6108 1d50 LimeSDR-USB  Serial: XXXXXXXXXXXXXXXXX
```

## Firmware Sources
```
https://github.com/myriadrf/LimeSuite
https://github.com/myriadrf/gr-limesdr
https://github.com/myriadrf/pyLMS7002Soapy
```

## Supported Software
- GNURadio
- GQRX
- LimeUtil
- LimeVNA
- SDRAngel
- Soapy Remote

## Command Line Tools
- LimeQuickTest
