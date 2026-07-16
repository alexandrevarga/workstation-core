# Architecture Decision Records

This directory contains the chronological log of architectural decisions governing the `workstation-core` provisioning lifecycle.

## Decision Dependency Graph

The diagram below illustrates the logical hierarchy and conceptual dependencies of the decisions. Foundational principles dictate provisioning mechanics, which in turn support presentation layer configurations.

```mermaid
graph TD
    %% Foundational Principles
    ADR0004["ADR 0004: YAGNI & Eventual Determinism"] --> ADR0001["ADR 0001: Dual-Repository Isolation"]
    
    %% Provisioning & Privilege Mechanics
    ADR0001 --> ADR0006["ADR 0006: Stage-Based Systemland"]
    ADR0006 --> ADR0002["ADR 0002: GNU Stow Engine"]
    
    %% Orchestration & UX
    ADR0002 --> ADR0005["ADR 0005: Hybrid Stow Orchestration"]
    ADR0005 --> ADR0003["ADR 0003: GNOME Wayland Presentation"]

    %% Late-Binding / Security
    ADR0001 --> ADR0007["ADR 0007: Late-Binding Path Obfuscation"]
    ADR0007 --> ADR0005

    style ADR0004 fill:#1f2937,stroke:#374151,stroke-width:2px,color:#fff
    style ADR0001 fill:#1f2937,stroke:#374151,stroke-width:2px,color:#fff
    style ADR0006 fill:#111827,stroke:#4b5563,stroke-dasharray: 5 5,color:#d1d5db
    style ADR0002 fill:#111827,stroke:#4b5563,stroke-dasharray: 5 5,color:#d1d5db
    style ADR0005 fill:#030712,stroke:#6b7280,color:#9ca3af
    style ADR0003 fill:#030712,stroke:#6b7280,color:#9ca3af
    style ADR0007 fill:#1f2937,stroke:#374151,stroke-width:2px,color:#fff
```

## ADR Index

| ID | Decision | Date | Status | Core Impact |
| :--- | :--- | :--- | :--- | :--- |
| [0001](0001-dual-repository-state-isolation.md) | Dual-Repository State Isolation | 2026-07-11 | Accepted | Establishes the boundary between public core and private overlay. |
| [0002](0002-provisioning-engine-stow.md) | GNU Stow Provisioning Engine | 2026-07-11 | Accepted | Adopts symlinking for zero-dependency user configuration. |
| [0003](0003-presentation-layer-wayland.md) | GNOME Wayland Presentation Layer | 2026-07-11 | Accepted | Defers raw Tiling Window Managers in favor of stable hardware integration. |
| [0004](0004-eventual-determinism-via-yagni.md) | Friction-Driven YAGNI | 2026-07-12 | Accepted | Restricts configuration mapping strictly to elements causing workflow friction. |
| [0005](0005-tiered-stow-orchestration.md) | Hybrid Stow Orchestration | 2026-07-12 | Accepted | Combines atomic directories with Make target orchestration. |
| [0006](0006-stage-based-systemland-provisioning.md) | Stage-Based Systemland | 2026-07-15 | Accepted | Separates unprivileged user symlinks from elevated root operations. |
| [0007](0007-late-binding-path-obfuscation.md) | Late-Binding Path Obfuscation | 2026-07-16 | Accepted | Decouples private path structures and enforces anonymous naming. |
