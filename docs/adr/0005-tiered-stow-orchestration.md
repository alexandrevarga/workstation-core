# ADR 0005: Hybrid Stow Orchestration

**Status:** Accepted
**Date:** 2026-07-12
**Affected Components:** `Makefile`, `stow-packages`

## 1. Context & Problem Statement

When designing the GNU Stow directory hierarchy, three standard taxonomies present operational friction:

1. **The Monolith:** A single root directory. Provides rapid deployment (`stow .`) but violates context boundaries, forcing GUI payloads onto headless servers.
2. **Categorized Packages:** Logical groupings (`cli/`, `gui/`). Provides baseline isolation but introduces boundary friction (deciding where overlapping tools belong) and maintenance overhead.
3. **Atomic Packages:** One-to-one mapping. Provides strict isolation and prevents cross-contamination, but introduces operational friction when attempting full-system deployments which require manual command chains.

This architecture requires an orchestration framework that enforces the modularity of Atomic Packages without sacrificing the ergonomics of full-system deployments.

## 2. Decision

This architecture adopts a **Hybrid Orchestration Model**.
The repository enforces the **Atomic Packages** taxonomy at the filesystem level. Lifecycle management is abstracted through `GNU Make`.

The `Makefile` declares contextual targets (`make core`, `make desktop`) that aggregate atomic packages for macro-deployments, and defines pattern rules (`$(ALL_PACKAGES)`) to allow execution of individual atomic units.

## 3. Rationale

Decoupling structural filesystem modularity from Makefile deployment logic resolves the trade-offs of the standard taxonomies:

- **Macro-Ergonomics:** `make core` matches the deployment speed of a Monolithic hierarchy while maintaining context-aware boundaries.
- **Atomic Validation:** `make [package]` natively targets a single directory, enabling isolated rollouts, rollback validations, and lifecycle management without global state side-effects.
