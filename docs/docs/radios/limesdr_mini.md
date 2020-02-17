---
layout: default
title: LimeSDR Mini
parent: Radios
nav_order: 5
---

# LimeSDR Mini
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Smaller version of the LimeSDR USB with almost half the specifications. More information about this device can be found on the [Myriad Wiki](https://wiki.myriadrf.org/LimeSDR-Mini). 

## Specifications

| Specification   | Value           |
|:----------------|:----------------|
| Frequency Range | 10 - 3500 MHz   |
| Bandwidth       | Up to 30.72 Msps (Stable) |
| ADC Resolution  | 12-bits         |
| USB Speed       | 3.0 (FT601)     |
| TX Mode         | Yes             |
| Duplex          | Full            |
| Crystal         | Rakon TCXO (4.0 ppm stable) |
| Bias-T          | No              |

## Device Fingerprint
```bash
$ lsusb
Bus 020 Device 009: ID 0403:601f Future Technology Devices International Limited LimeSDR Mini  Serial: XXXXXXXXXXXXXX
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
