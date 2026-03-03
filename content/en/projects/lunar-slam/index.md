---
title: Localization and Navigation for Lunar/Planetary Rovers
date: 2024-04-01
summary: >
  Research on robust state estimation and autonomous navigation for rovers operating
  in extreme environments with minimal geometric features, such as the lunar surface.
tags:
  - SLAM
  - Space Robotics
  - Localization
  - Navigation
links:
  - type: site
    url: https://astro2.mech.tohoku.ac.jp/research/
    name: Space Robotics Lab Research
---

## Overview

The lunar surface and other planetary terrains pose fundamental challenges for autonomous robot navigation. Unlike structured environments on Earth, these extraterrestrial surfaces are characterized by **extremely sparse geometric features** — monotonous regolith plains, low-texture slopes, and highly repetitive crater morphology — that cause conventional visual and LiDAR-based localization methods to fail or degrade severely.

This research focuses on developing robust **Simultaneous Localization and Mapping (SLAM)** and autonomous navigation techniques specifically designed for such feature-deprived environments. The core challenge is to estimate a rover's position and orientation with high accuracy when the surrounding world offers little to no distinctive structure that standard algorithms can anchor on.

## Research Directions

### Feature-Deprived SLAM

Standard SLAM pipelines rely on identifying and tracking distinctive landmarks. On the lunar surface, such landmarks are nearly absent. Our approach investigates multi-modal sensor fusion — combining wheel odometry, inertial measurements, sun-sensor heading, and terrain surface normals — to provide reliable pose estimates even when camera or LiDAR data is uninformative.

### Terrain-Adaptive Navigation

Safe traversal on unstructured regolith requires real-time assessment of terrain traversability. This research develops perception algorithms that classify surface properties (slope, roughness, compaction) from onboard sensors, enabling the rover to autonomously plan paths that avoid hazardous zones while progressing toward mission goals.

### Loop Closure in Repetitive Terrain

Accumulated drift in dead-reckoning is inevitable on long traversals. Detecting revisited locations — loop closure — is critical to correcting this drift, but standard appearance-based methods are ineffective when terrain looks the same everywhere. We explore geometry-based and probabilistic approaches to recognize previously visited areas without relying on visual appearance.

## Background

The Space Robotics Laboratory at Tohoku University has a long track record in lunar and planetary robotics. In the 2011–2018 **Google Lunar XPRIZE** competition, the lab developed **HAKUTO**, a lightweight four-wheeled rover designed to traverse the lunar surface. The technical heritage from HAKUTO — including wheel design, mobility analysis, and localization strategies — forms the foundation of ongoing research and has been carried forward by ispace Inc., a lunar landing startup.

This project builds directly on that legacy, advancing the state of the art in autonomous localization and navigation so that future lunar missions can operate with greater independence from Earth-based control.

## Affiliation

Conducted at the [Space Robotics Laboratory](https://astro2.mech.tohoku.ac.jp/), Department of Aerospace Engineering, Tohoku University.
