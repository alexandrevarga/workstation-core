# ADR 0007: Late-Binding Path Obfuscation

**Status:** Accepted
**Date:** 2026-07-16
**Affected Components:** `security`, `orchestration`, `Makefile`

## 1. Context & Problem Statement

Public configuration repositories that integrate with private overlays via hardcoded relative directory structures leak the physical partition topology and directory layouts of the host system, exposing metadata to auditing tools. Standard semantic labeling of private directories using high-value target keywords further accelerates static analysis detection.

## 2. Alternatives Considered

* **Parameter-Driven Script Flags:** Passes absolute paths during bootstrap commands. This introduces execution friction by requiring manual path entry on every execution loop.
* **Metadata Encryption within Public Tree:** Encrypts state variables directly in the public repository. This leaves encrypted payloads and directory structures visible within the public Git history.

## 3. Decision

The workstation orchestration layer enforces **Late-Binding Path Obfuscation**:

1. **Environment-Driven Injection:** The `Makefile` and core shell scripts must resolve the absolute path of the private overlay exclusively via the `$KITCHEN_PATH` environment variable.
2. **Neutral Package Naming:** All directories and symlink targets containing sensitive payloads must adopt generic system naming conventions.

## 4. Rationale

Decoupling the physical path of the private overlay from the public repository structure prevents host disk topology exposure. The filesystem location of the private configuration remains anonymous.

Neutral naming conventions eliminate obvious targets during filesystem scans or configuration audits, treating configuration payloads as standard system components.
