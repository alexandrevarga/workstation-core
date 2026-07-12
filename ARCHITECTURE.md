# Architecture & Design Principles

This repository orchestrates a reproducible, ephemeral, and strictly decoupled workstation environment. The design heavily adapts industry-standard distributed systems methodologies—specifically the **Twelve-Factor App** principles and **Google SRE** practices—to a single-node endpoint.

## 1. Deterministic State & Idempotency

> *(Inspired by Martin Fowler's Infrastructure as Code)*

Configuration drift is technical debt. The core workstation must be rebuildable from a vanilla operating system with zero cognitive overhead. Provisioning must be idempotent, allowing the orchestration layer to be executed repeatedly without side effects. The host OS is treated as disposable cattle, not a pet.

## 2. Cryptographic & Contextual Boundary (Zero-Trust)

> *(Adapted from Twelve-Factor App: III. Config)*

This repository contains unprivileged OS orchestration and structural blueprints. It acts as the public skeleton. Sensitive payloads, RBAC tokens, SSH/GPG keys, and operational security tooling are injected dynamically at runtime via **Late-Binding** from an air-gapped or encrypted external overlay (`local-overlay`). Secrets are strictly decoupled from the public codebase.

## 3. The Isolation Heuristic (Dependency Tiers)

> *(Adapted from Twelve-Factor App: II. Dependencies)*

Software dependencies are explicitly declared and strictly categorized to prevent host environment corruption:

* **Tier 0 (Bare Metal Host):** Kernel, Wayland compositor, virtualization hypervisors (KVM/Podman), and core package management (`dnf`).
* **Tier 1 (Sandboxed GUI):** All graphical applications run within isolated runtimes (`flatpak`).
* **Tier 2 (Ephemeral Toolchains):** Development dependencies, language runtimes (Node, Python, Go), and compilation chains are banned from the host and confined to transient containers (`distrobox`/`toolbx`).
* *Escape Hatch:* A tool may be promoted to Tier 0 exclusively if its containerized isolation causes unacceptable friction to the developer flow, prioritizing operational ergonomics over dogmatic purity.
