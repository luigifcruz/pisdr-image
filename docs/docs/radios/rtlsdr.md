---
layout: default
title: RTL-SDR
parent: Radios
nav_order: 8
---

# RTL-SDR
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

Currently, the most popular SDR device. Supported by the PiSDR with the modified library provided by the [RTL-SDR Blog](https://www.rtl-sdr.com). This library adds patches to improve performance within the L-Band, improves over-heating problems and enables the Bias-T on supported devices.

## Specifications

| Specification   | Value           |
|:----------------|:----------------|
| Frequency Range | 24 - 1766 MHz   |
| Bandwidth       | Up to 2.56 Msps (Stable) |
| ADC Resolution  | 8-bits          |
| USB Speed       | 2.0             |
| TX Mode         | No             |
| Crystal         | TCXO (0.5-1.0 ppm stable)[^1] |
| Bias-T          | Yes[^1]         |

## Device Fingerprint
```bash
$ lsusb
Bus 020 Device 006: ID 0bda:2838 Realtek Semiconductor Corp. RTL2838UHIDIR  Serial: 00000001
```

## Firmware Sources
```
https://github.com/osmocom/rtl-sdr
```

## Supported Software
- GQRX 
- SDRAngel
- GNURadio
- Soapy Remote

## Command Line Tools
- rtl_adsb
- rtl_biast
- rtl_eeprom
- rtl_fm
- rtl_power 
- rtl_sdr
- rtl_tcp
- rtl_test

---
[^1]: _Official model from the RTL-SDR blog._
