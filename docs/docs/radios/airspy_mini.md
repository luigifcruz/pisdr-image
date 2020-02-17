---
layout: default
title: Airspy Mini
parent: Radios
nav_order: 2
---

# Airspy Mini
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

## Specifications

| Specification   | Value           |
|:----------------|:----------------|
| Frequency Range | 24 - 1700 MHz   |
| Bandwidth       | 3, 6 or 10 Msps |
| ADC Resolution  | 8-bits          |
| USB Speed       | 2.0             |
| TX Mode         | No              |
| Crystal         | TCXO (0.5 ppm stable) |
| Bias-T          | Yes             |

## Device Fingerprint
```bash
$ lsusb
Bus 001 Device 007: ID 1d50:60a1 OpenMoko, Inc. Airspy
```

## Firmware Sources
```
https://github.com/airspy/airspyone_host
```

## Supported Software
- GQRX 
- SDRAngel
- GNURadio
- Soapy Remote
