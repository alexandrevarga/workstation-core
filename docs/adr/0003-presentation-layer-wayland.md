# ADR 0003: Presentation Layer (GNOME Wayland)

**Status:** Accepted
**Date:** 2026-07-11
**Affected Components:** `desktop`, `window-manager`

## 1. Context & Problem Statement

The choice of Desktop Environment or Window Manager dictates the developer's daily cognitive load. While Tiling Window Managers offer keyboard-driven efficiency, they require manual configuration for peripheral management and display scaling.

## 2. Alternatives Considered

* **Tiling Window Managers:** Provide native keyboard-driven efficiency but introduce unacceptable configuration overhead for basic peripheral management.
* **Legacy X11 Environments:** Deprecated due to security vulnerabilities and architectural limitations.

## 3. Decision

The workstation will utilize **GNOME on Wayland** for the initial architecture.
To achieve the keyboard-driven workflow of a TWM, the environment utilizes the custom `Focus-Matrix` extension.

## 4. Rationale

GNOME provides native hardware and peripheral orchestration, eliminating the maintenance overhead required by standalone window managers. Native Wayland enforces security isolation between graphical applications.

A transition to a Wayland TWM is deferred until the ecosystem provides deterministic peripheral orchestration without custom shell scripting.
