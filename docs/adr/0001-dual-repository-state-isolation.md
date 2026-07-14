# ADR 0001: Dual-Repository State Isolation

**Status:** Accepted
**Date:** 2026-07-11
**Affected Components:** `infra`, `security`, `bootstrap`

## 1. Context & Problem Statement

An engineering workstation requires the execution of both generic environment configurations and sensitive operational payloads. Storing both in a single repository risks credential leakage and violates the principle of least privilege if the repository is audited or published.

## 2. Alternatives Considered

* **Single Private Repository:** Obfuscates the system's architectural blueprint, preventing open-source collaboration and external technical auditing.
* **Encrypted Secrets in Public Repo:** Exposes the metadata and existence of sensitive files. If the encryption key is compromised, the historical payload is exposed.

## 3. Decision

The workstation state is split into a **Twin-Engine Architecture**:

1. **`workstation-core` (Public Repository):** Handles unprivileged OS orchestration, structural blueprints, and dependency management.
2. **`local-overlay` (Private Vault):** An external, encrypted vault containing cryptographic keys, tokens, and sensitive scripts.

The `workstation-core` integrates with the `local-overlay` via **Late-Binding**. Configuration files in the core repository utilize conditional hooks that fall back if the overlay is absent.

## 4. Rationale

This architecture enforces a Zero-Trust boundary. The public repository acts as an architectural blueprint, demonstrating orchestration and access control methodologies. The operational payloads remain physically decoupled and inaccessible. This eliminates the risk of accidental Git leaks while maintaining a functional public foundation.
