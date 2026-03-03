---
title: Small Satellite Development at Osaka Metropolitan University (SSSRC)
date: 2022-04-01
summary: >
  Development of small satellites, including OMUSAT-3 and Hirogari, at the Space System and
  Space Science Research Center (SSSRC), Osaka Metropolitan University. Responsible for the
  entire communications subsystem — from telemetry and telecommand design to SSTV broadcasting
  of Earth imagery for the amateur radio community.
tags:
  - Satellite
  - Communications
  - SSTV
  - Amateur Radio
  - Embedded Systems
links:
  - type: site
    url: https://www.omu.ac.jp/eng/sssrc/
    name: SSSRC — Osaka Metropolitan University
---

## Overview

At the **Space System and Space Science Research Center (SSSRC)** of Osaka Metropolitan University,
I was involved in the end-to-end development and operation of two small satellites:
**OMUSAT-3** and **Hirogari**.
My primary responsibility was the **communications subsystem**, which sits at the intersection
of the mission and the bus — making it essential to understand both deeply.

## Communications Subsystem

The communications subsystem I developed covered every link between the spacecraft and the ground:

- **Housekeeping / Telemetry (HK):** Designed and implemented the downlink of satellite health data,
  including power, temperature, attitude, and subsystem status.
- **Uplink (Telecommand):** Built the command uplink chain to send instructions from the ground
  station to the satellite.
- **Downlink (Mission Data):** Managed the downlink of mission payloads and ensured reliable
  data delivery under varying link budgets and orbital geometries.

Because the communications subsystem interfaces with every other bus subsystem (power, OBC, ADCS)
and with the mission payload, this role required me to thoroughly understand the satellite as a whole —
from power budgets and thermal constraints to protocol framing and error correction.

## SSTV — Broadcasting Earth Imagery for Amateur Radio Operators

As a unique mission contribution, I designed and implemented **Slow Scan Television (SSTV)**
transmission for OMUSAT-3.
SSTV is a narrow-band image transmission mode long used by the amateur radio community,
allowing standard shortwave receivers to reconstruct images from audio-frequency signals.

The mission objective was to **broadcast images of the Earth taken from orbit** so that amateur
radio operators around the world could receive and decode them using conventional equipment.
I am deeply familiar with the SSTV protocol stack — modulation, color encoding, synchronization,
and timing — having implemented it from scratch for a space application.

## Hirogari

In addition to OMUSAT-3, I participated in the development and operation of **Hirogari**,
another small satellite developed within the SSSRC.
This broadened my experience across different mission phases, from pre-launch integration
and testing to on-orbit operations and anomaly resolution.

## Affiliation

Developed at the [Space System and Space Science Research Center (SSSRC)](https://www.omu.ac.jp/eng/sssrc/),
Osaka Metropolitan University.