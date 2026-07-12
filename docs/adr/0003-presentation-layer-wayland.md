# ADR 0003: Presentation Layer (GNOME Wayland)

**Status:** Accepted
**Date:** 2026-07-11
**Affected Components:** `desktop`, `window-manager`

## 1. Context & Problem Statement

The choice of Desktop Environment or Window Manager fundamentally dictates the developer's daily cognitive load. While Tiling Window Managers offer extreme keyboard-driven efficiency, they often require extensive manual configuration for peripheral management and display scaling.

## 2. Alternatives Considered

* **Tiling Window Managers:** Extremely lightweight and highly efficient for keyboard-centric workflows. However, maintaining the ecosystem introduces significant cognitive overhead and friction.
* **Legacy X11 Environments:** Officially deprecated due to inherent security vulnerabilities and architectural limitations.

## 3. Decision

The workstation will utilize **GNOME on Wayland** for the initial architecture.
To achieve the keyboard-driven workflow of a TWM, the environment utilizes the custom `Focus-Matrix` extension.

## 4. Rationale

GNOME provides a highly polished, "out-of-the-box" experience for hardware and peripheral orchestration, significantly reducing the cognitive load required to maintain the system. By leveraging native Wayland, the environment enforces strict security boundaries between graphical applications.

A transition to a pure Wayland TWM remains a consideration for future architectural revisions once the ecosystem matures to an acceptable level of out-of-the-box stability.
