# ADR 0001: Dual-Repository State Isolation

**Status:** Accepted
**Date:** 2026-07-11
**Affected Components:** `infra`, `security`, `bootstrap`

## 1. Context & Problem Statement

A mature engineering workstation requires the execution of both generic environment configurations and highly sensitive operational payloads. Storing both in a single repository risks credential leakage and violates the principle of least privilege if the repository is audited or published.

## 2. Alternatives Considered

* **Single Private Repository:** Safe, but obfuscates the system's architectural blueprint, preventing open-source collaboration and external technical auditing.
* **Encrypted Secrets in Public Repo:** Exposes the metadata and existence of sensitive files. If the encryption key is ever compromised, the entire historical payload is exposed.

## 3. Decision

The workstation state is split into a **Twin-Engine Architecture**:

1. **`workstation-core` (Public):** Handles unprivileged OS orchestration, structural blueprints, and dependency management.
2. **`local-overlay` (Strictly Private):** An external, encrypted vault containing all cryptographic keys, tokens, and sensitive scripts.

The `workstation-core` integrates with the `local-overlay` via **Late-Binding**. Configuration files in the core repository utilize conditional hooks that silently fall back if the overlay is absent.

## 4. Rationale

This architecture enforces a strict Zero-Trust boundary. The public repository acts as a transparent architectural blueprint, demonstrating enterprise-grade orchestration and access control methodologies. The actual operational payloads remain physically decoupled and inaccessible. It eliminates the risk of accidental Git leaks while maintaining a fully functional public foundation.
