# ADR 0006: Stage-Based Systemland Provisioning

**Status:** Accepted
**Date:** 2026-07-15
**Affected Components:** `bootstrap`, `security`, `orchestration`

## 1. Context & Problem Statement

An engineering workstation requires privilege elevation to configure system-level components such as filesystem subvolumes, network kernel parameters, and hypervisor virtualization storage. Managing these system-level configurations using the same orchestration engine as user-level dotfiles introduces file ownership vulnerabilities in the user home directory and increases bootstrap fragility.

## 2. Alternatives Considered

* **Ansible or Puppet:** Provide declarative system management but depend on Python runtimes or daemon agents, violating the lightweight, zero-dependency bootstrap requirement.
* **Monolithic Provisioning Scripts:** Maintain a single root execution script, but lack execution granularity, making selective rollback or partial deployment difficult and increasing system brick risks during failure states.

## 3. Decision

System-level provisioning is decoupled from dotfiles orchestration and split into modular, stage-based shell scripts. The architecture enforces the following boundaries:

1. **Execution Context Preservation:** Dotfile orchestration via Stow must execute strictly in user space to leverage native environment variables ($HOME, $XDG_CONFIG_HOME) without runtime overrides or path emulation hacks.
2. **Modular Fault Containment:** Systemland configurations are isolated into independent scripts. A failure in a system stage must not block userland environment deployments.

## 4. Rationale

Decoupling userland dotfiles from system mutations limits the security blast radius. Executing the orchestration layer with standard user privileges guarantees that scripting errors or unhandled path resolution failures cannot corrupt core system-level directories.

Furthermore, separating contexts ensures that system dependencies and host configurations are executed only on demand, preventing environmental pollution and ensuring the core system bootstrap remains lightweight and deterministic.
