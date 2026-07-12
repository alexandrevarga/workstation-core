# ADR 0002: Provisioning Engine (GNU Stow)

**Status:** Accepted
**Date:** 2026-07-11
**Affected Components:** `dotfiles`, `bootstrap`, `orchestration`

## 1. Context & Problem Statement

Configuration files ("dotfiles") reside in a version-controlled repository, but operating system applications expect them in standard XDG Base Directory locations (e.g., `~/.config/`). A reliable engine is required to map these files from the Git tree to their target destinations on the host filesystem without introducing excessive complexity or build-time dependencies.

## 2. Alternatives Considered

* **Ansible / Chezmoi:** Exceptional, industry-standard tools that offer robust state management, templating, and native secret handling. However, they are designed for comprehensive fleet management and require higher-level runtimes (Python, Go) to be present on the target machine. For this specific project, requiring these runtimes during the bare-metal "Day Zero" bootstrap phase was deemed unnecessary.
* **Custom Bash Copy/Link Scripts:** Prone to edge cases (handling existing directories, permission structures) and silent failures. They also break bi-directional synchronization if files are copied rather than symlinked.

## 3. Decision

The provisioning lifecycle will be orchestrated natively by **GNU Stow**, executed via a standard `Makefile`. Stow will generate deterministic symlinks directly from the Git tree to the host filesystem.

## 4. Rationale

While Ansible and Chezmoi are indisputable industry leaders for configuration management, this project adopts a strict minimalist and purist approach for its foundation. This decision embraces the **Unix Philosophy** and the **KISS (Keep It Simple, Stupid)** principle.

GNU Stow is a zero-dependency C binary available natively in the core repositories of nearly all Linux distributions. By relying on a native binary, the Day Zero bootstrap process remains exceptionally lightweight and fail-safe on a freshly formatted OS.

Furthermore, symlinking ensures bi-directional synchronization: editing a file directly in `~/.config` immediately updates the Git tree, significantly reducing the cognitive load of manual synchronization for the engineer.
