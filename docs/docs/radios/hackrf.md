---
layout: default
title: HackRF
parent: Radios
nav_order: 9
---

# HackRF One
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Specifications

| Specification   | Value           |
|:----------------|:----------------|
| Frequency Range | 1 - 6000 MHz   |
| Bandwidth       | Up to 20 Msps   |
| ADC Resolution  | 8-bits          |
| USB Speed       | 2.0             |
| TX Mode         | Yes             |
| Duplex          | Half            |
| Crystal         | 20 ppm          |
| Bias-T          | No              |

## Device Fingerprint
```bash
$ lsusb
Bus 003 Device 003: ID 1d50:60a1 OpenMoko, Inc. Airspy
```

## Firmware Sources
```
https://github.com/mossmann/hackrf.git
https://github.com/pothosware/SoapyHackRF.git
```

## Supported Software
- GQRX 
- SDRAngel
- GNURadio
- Soapy Remote