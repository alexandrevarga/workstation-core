# ADR 0003: Presentation Layer (GNOME Wayland)

**Status:** Accepted
**Date:** 2026-07-11
**Affected Components:** `desktop`, `window-manager`

## 1. Context & Problem Statement

The choice of Desktop Environment (DE) or Window Manager (WM) fundamentally dictates the developer's daily cognitive load. While Tiling Window Managers (TWMs) offer extreme keyboard-driven efficiency, they often require extensive manual configuration for peripheral management (Bluetooth, Wi-Fi, Audio, Screen Sharing) and display scaling.

## 2. Alternatives Considered

* **Tiling Window Managers (Sway, Hyprland):** Extremely lightweight and highly efficient for keyboard-centric workflows. However, maintaining the ecosystem (status bars, notification daemons, screen sharing portals) introduces significant cognitive overhead and friction.
* **Legacy X11 Environments:** Officially deprecated due to inherent security vulnerabilities (e.g., lack of GUI isolation/keylogging protection) and architectural limitations.

## 3. Decision

The workstation will utilize **GNOME on Wayland** for the v1.0 architecture.
To achieve the keyboard-driven workflow of a TWM, the environment utilizes a custom, declarative extension (`Focus-Matrix`).

## 4. Rationale

GNOME provides a highly polished, "out-of-the-box" experience for hardware and peripheral orchestration, significantly reducing the cognitive load required to maintain the system. By leveraging native Wayland, the environment enforces strict security boundaries between graphical applications.

The inherent problem of window management friction within GNOME was solved via the in-house `Focus-Matrix` extension. It bypasses standard UI layers and hooks directly into the Mutter compositor, providing native Auto-Move and Run-or-Raise capabilities without the memory leaks or race conditions found in legacy extensions.

A transition to a pure Wayland TWM (e.g., Sway) remains a consideration for future architectural revisions (v2.0) once the ecosystem matures to an acceptable level of out-of-the-box stability.
