# ADR 0004: Friction-Driven Eventual Determinism via YAGNI

**Status:** Accepted
**Date:** 2026-07-12
**Affected Components:** `orchestration`, `philosophy`, `state-management`

## 1. Context & Problem Statement

The industry standard for Infrastructure as Code dictates that a system's state should be deterministic and preemptively mapped. Attempting to codify default operating system behaviors introduces accidental complexity. It forces the engineer to manage state that may never change, violating the YAGNI principle and creating maintenance fatigue.

## 2. Alternatives Considered

* **Total State Management:** Guarantees determinism but requires mapping configuration for behaviors that require no modification. The cognitive load to maintain this exceeds the value for a single-node workstation.
* **Ad-Hoc Scripting without Principles:** Fast, but leads to configuration drift and an unrecoverable system state over time.

## 3. Decision

This repository adopts a model of **Eventual Determinism**, governed by a **Friction-Driven Workflow**.

Configuration is codified by this repository only when the default OS behavior introduces friction, breaks the engineering workflow, or poses a security risk. We accept configuration drift in the host OS as technical debt.

When an unmapped drift causes a failure, the system is treated as cattle and destroyed. The friction point that caused the failure is identified, codified into `workstation-core` or `local-overlay`, and the system is rebuilt.

## 4. Rationale

Applying YAGNI to infrastructure state reduces the codebase footprint. The repository remains lean, focused on required configurations. Determinism is not a Day-Zero requirement, but a state achieved over time as real-world friction dictates what needs to be controlled. This prioritizes operational ergonomics over architectural purity.
