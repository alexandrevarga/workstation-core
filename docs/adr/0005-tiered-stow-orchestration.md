# ADR 0005: Hybrid Stow Orchestration

**Status:** Proposed
**Date:** 2026-07-12
**Affected Components:** `Makefile`, `stow-packages`

## 1. Context & Problem Statement

When designing the GNU Stow directory hierarchy, we evaluated three standard taxonomies, each presenting operational friction:

1. **The Monolith:** A single root directory. Provides instant deployment (`stow .`) but violates context boundaries, forcing GUI payloads onto headless servers.
2. **Categorized Packages:** Logical groupings (`cli/`, `gui/`). Provides baseline isolation but introduces boundary friction (deciding where overlapping tools belong) and structural maintenance overhead.
3. **Atomic Packages:** Strict one-to-one mapping (e.g., `git/`, `tmux/`). Provides absolute isolation and prevents cross-contamination, but introduces massive operational friction when attempting full-system deployments (requiring long, manual command chains).

We require an orchestration framework that enforces the modularity of Atomic Packages without sacrificing the macro-ergonomics of full-system deployments.

## 2. Decision

We will adopt a **Hybrid Orchestration Model**.
The repository will strictly enforce the **Atomic Packages** taxonomy at the filesystem level. However, lifecycle management will be abstracted through `GNU Make`.

The `Makefile` will declare contextual targets (`make core`, `make desktop`) that aggregate atomic packages for macro-deployments, while simultaneously defining pattern rules (`$(ALL_PACKAGES)`) to allow direct execution of individual atomic units.

## 3. Rationale

By decoupling the structural modularity (Filesystem) from the deployment logic (Makefile), we resolve the trade-offs of all three legacy taxonomies:

- **Macro-Ergonomics:** `make core` achieves the speed of a Monolithic deployment with the safety of context-aware boundaries.
- **Atomic Validation:** `make [package]` natively targets a single directory, enabling surgical rollouts, rollback validations, and isolated lifecycle management without global state side-effects.
