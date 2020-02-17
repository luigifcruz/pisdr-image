---
layout: default
title: LimeNET Micro
parent: Radios
nav_order: 4
---

# LimeNET Micro
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

This device is a computer based on a Raspberry Pi 3B+ Compute Module with a built-in LimeSDR Micro. The SDR specifications are almost identical with some exceptions like the addition of a more precise oscillation crystal. This radio also has an GPSDO based on the Ublox NEO-M8T. More information about this device can be found on the [Myriad Wiki](https://wiki.myriadrf.org/LimeNET_Micro). 

## Specifications

| Specification   | Value           |
|:----------------|:----------------|
| Frequency Range | 10 - 3500 MHz   |
| Bandwidth       | Up to 10 Msps (Stable) |
| ADC Resolution  | 12-bits         |
| USB Speed       | 2.0 (FT601)     |
| TX Mode         | Yes             |
| Duplex          | Full            |
| Crystal         | Rakon OCXO (+/-5 ppb) |
| Bias-T          | No              |

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
