# ADR 0004: Eventual Determinism via YAGNI (Friction-Driven Workflow)

**Status:** Accepted
**Date:** 2026-07-12
**Affected Components:** `orchestration`, `philosophy`, `state-management`

## 1. Context & Problem Statement
The industry standard for Infrastructure as Code dictates that a system's state should be 100% deterministic and preemptively mapped. However, attempting to declare every possible configuration of a desktop operating system introduces immense accidental complexity. It forces the engineer to manage state that may never change or cause issues, violating the YAGNI principle and creating maintenance fatigue.

## 2. Alternatives Considered
* **Total State Management:** Guarantees absolute determinism but requires mapping thousands of lines of configuration for default behaviors that already work perfectly out-of-the-box. The cognitive load to maintain this exceeds the value for a single-node workstation.
* **Ad-Hoc Scripting without Principles:** Fast, but leads to configuration drift and an unrecoverable system state over time.

## 3. Decision
This repository adopts a model of **Eventual Determinism**, governed by a strict **Friction-Driven Workflow**. 

Configuration is only codified and managed by this repository *if and only if* the default OS behavior introduces friction, breaks the engineering workflow, or poses a security risk. We explicitly accept minor, non-blocking configuration drift in the host OS as acceptable technical debt.

When an unmapped drift causes a critical failure, the system is treated as "cattle" and destroyed. The friction point that caused the failure is then identified, codified into `workstation-core` or `local-overlay`, and the system is rebuilt. 

## 4. Rationale
By applying YAGNI to infrastructure state, we drastically reduce the codebase footprint. The repository remains lean, focused only on high-value configurations. Determinism is not an absolute Day-Zero requirement, but a state that is organically achieved over time as real-world friction dictates what needs to be controlled. This prioritizes engineering ergonomics and agility over theoretical architectural purity.
