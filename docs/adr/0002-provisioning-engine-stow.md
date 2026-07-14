# ADR 0002: Provisioning Engine (GNU Stow)

**Status:** Accepted
**Date:** 2026-07-11
**Affected Components:** `dotfiles`, `bootstrap`, `orchestration`

## 1. Context & Problem Statement

Configuration files reside in a version-controlled repository, but operating system applications expect them in standard XDG Base Directory locations. A reliable engine is required to map these files from the Git tree to their target destinations on the host filesystem without introducing complexity or build-time dependencies.

## 2. Alternatives Considered

* **Ansible / Chezmoi:** Provide robust state management but introduce unacceptable runtime dependencies (Python, Go binaries) to the Core Host OS, violating the Day Zero lightweight bootstrap requirement.
* **Custom Bash Symlink Scripts:** Writing custom `ln -s` loops requires re-implementing tree-folding and state-management logic from scratch. This introduces unnecessary maintenance overhead for a problem natively solved by GNU Stow, violating the YAGNI principle.

## 3. Decision

The provisioning lifecycle is orchestrated by **GNU Stow**, executed via `Makefile`. Stow generates deterministic symlinks directly from the Git tree to the host filesystem.

## 4. Rationale

To eliminate Day Zero bootstrap friction, this architecture is built upon the **Unix Philosophy**. 

GNU Stow is a Perl utility available in the core repositories of Linux distributions. It performs a single task—symlink management—without requiring heavy external runtimes or templating engines. This guarantees the bootstrap process remains lightweight and fail-safe on a freshly formatted OS.

Furthermore, symlinking provides bi-directional synchronization. Editing a file directly in `~/.config` modifies the tracked source file in the local repository, eliminating the cognitive load of manual copy-back synchronization.
