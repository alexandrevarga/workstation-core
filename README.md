# workstation-core

[![Code Quality](https://github.com/alexandrevarga/workstation-core/actions/workflows/lint.yml/badge.svg)](https://github.com/alexandrevarga/workstation-core/actions/workflows/lint.yml)
[![Fedora](https://img.shields.io/badge/Fedora-Workstation-294172?logo=fedora&logoColor=white)](https://fedoraproject.org/)
[![Podman](https://img.shields.io/badge/Podman-892CA0?logo=podman&logoColor=white)](https://podman.io/)
[![Systemd](https://img.shields.io/badge/Systemd-black?logo=systemd)](https://systemd.io/)
[![SELinux](https://img.shields.io/badge/SELinux-Enforcing-red)](https://github.com/SELinuxProject)
[![GNU Make](https://img.shields.io/badge/GNU_Make-00A651?logo=gnu&logoColor=white)](https://www.gnu.org/software/make/)
[![GNU Bash](https://img.shields.io/badge/GNU_Bash-4EAA25?logo=gnu-bash&logoColor=white)](https://www.gnu.org/software/bash/)

> *"The menu is public, the recipe stays in the kitchen."*

Automated state management and configuration for my primary SRE engineering environment.

## Enterprise Rigor in a Single Node

This repository orchestrates my primary production workstation. It is engineered with the strict operational standards typically reserved for distributed fleets. Practices such as Architecture Decision Records (ADRs), Zero-Trust boundaries, Continuous Integration (CI/CD), and Infrastructure as Code (IaC) are enforced at the local level to guarantee a resilient, predictable, and auditable engineering environment.

## The Twin-Engine Architecture

To guarantee Operational Security (OpSec) while maintaining an open-source footprint, this environment operates on a dual-repository model:

- **The Menu (`workstation-core`):** This public repository. It serves as the transparent blueprint for the system, containing the architectural skeleton, unprivileged orchestration, and base configurations.
- **The Kitchen (`local-overlay`):** A strictly private, external vault injected via late-binding. It contains the actual intellectual property, access tokens, offensive security tools, traditional project governance, and systemic LLM governance workflows (secure prompts, API routing, data sanitization).

## Philosophy: Friction-Driven Workflow

This repository does not aim to be a massive, blind one-click restoration script. It is built under a strict minimalist premise:

> **Deploy Vanilla → Run & Observe → Identify Dealbreakers → Target & Intervene → Validate**

Every single configuration, package, or alias injected here must prove its worth by solving a tangible friction point encountered during real-world usage. If a default OS setting doesn't actively create friction or betray the thinking process, it stays untouched.

*For an in-depth look at the technical rigor behind this decision, refer to [ADR 0004: Eventual Determinism via YAGNI](docs/adr/0004-eventual-determinism-via-yagni.md).*

## Current State

**OS:** Fedora Workstation (Vanilla base stabilized)
**Status:** Architecture definition & local repository bootstrapping completed.
**Next Step:** Designing the structural orchestration layer.

## Documentation

To understand the engineering principles and design decisions governing this repository, please review:

- [Architecture & Design Principles](ARCHITECTURE.md)
- [Engineering Roadmap](ROADMAP.md)
- [Architecture Decision Records (ADRs)](docs/adr/)
