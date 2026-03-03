---
title: Radio-Based Localization and ISAC for Autonomous Systems
date: 2025-04-01
summary: >
  Research on Integrated Sensing and Communication (ISAC) for next-generation wireless
  networks (6G/Beyond 5G), developing signal processing and protocol design methods
  that simultaneously optimize robot localization accuracy and communication quality.
tags:
  - ISAC
  - SLAM
  - 6G
  - Signal Processing
  - Wireless Sensing
links:
  - type: site
    url: https://tr.is.tohoku.ac.jp/
    name: Tough Robotics Lab
---

## Overview

As autonomous systems — robots, vehicles, and drones — become increasingly integrated into society, their reliability hinges on two capabilities that have traditionally been treated separately: **knowing where they are** (localization) and **staying connected** (communication). This research challenges that separation.

The emerging paradigm of **Integrated Sensing and Communication (ISAC)** proposes that a single wireless signal can simultaneously carry data and sense the physical environment. By jointly designing the communication waveform and the sensing algorithm, it becomes possible to extract high-quality positional information from signals that are already being transmitted for data exchange — with no additional hardware cost and no dedicated sensing bandwidth.

## Why 6G and Beyond 5G?

The transition to **6G** and **Beyond 5G** networks introduces several properties that make ISAC particularly powerful:

- **Millimeter-wave and sub-terahertz frequencies** provide extremely fine range and angular resolution, enabling centimeter-level distance measurement.
- **Massive MIMO antenna arrays** allow precise beamforming, making it feasible to resolve the direction of reflected signals from multiple scatterers simultaneously.
- **Ultra-low latency** enables tight real-time feedback loops between sensing and control.
- **Network densification** places access points close to robots, improving both coverage and geometric diversity for localization.

These properties transform the wireless infrastructure itself into a dense, high-resolution sensor network — one that robots can exploit for state estimation without any dedicated sensing hardware.

## Research Directions

### Joint Waveform and Signal Processing Design

Achieving good sensing performance while maintaining communication throughput requires careful co-design of the transmitted signal. This research develops waveform optimization frameworks that balance the mutual information of the communication channel against the Fisher information available for parameter estimation (range, Doppler, angle), formulating the problem as a constrained optimization over signal codebooks.

### Radio-Inertial and Radio-LiDAR Fusion

Radio measurements alone — even from dense 6G infrastructure — are subject to multipath, NLOS (non-line-of-sight) errors, and geometric ambiguities. Tight fusion of radio observations with inertial measurement units (IMU) and LiDAR point clouds provides complementary information at different timescales and spatial resolutions. This research designs factor graph-based estimators that incorporate heterogeneous sensor modalities into a unified probabilistic framework.

### SLAM with Radio Landmark Maps

Beyond one-shot positioning, this research investigates how radio-based range and angle measurements can be incorporated into a SLAM pipeline. Access points act as radio landmarks with known or jointly estimated positions, enabling the robot to build a consistent map of the radio environment while correcting accumulated odometry drift — analogous to visual SLAM but robust to lighting and texture conditions.

### Protocol-Level Sensing Integration

At the network level, standard communication protocols (e.g., 5G NR) are not designed with sensing in mind. This research proposes extensions to reference signal structures and scheduling mechanisms that enable sensing-aware resource allocation, allowing base stations and user equipment to coordinate sensing measurements without sacrificing spectral efficiency.

## Affiliation

Conducted at the [Tough Robotics Laboratory](https://tr.is.tohoku.ac.jp/), Graduate School of Information Sciences, Tohoku University.
