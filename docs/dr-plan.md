# Workstation Disaster Recovery Plan

This document outlines the systematic, stage-based restoration protocol for the primary engineering environment.

## Architectural Principle: Friction-Driven Recovery

To prevent configuration bloat and eliminate legacy technical debt, the workstation is restored under a minimalist constraint:

> *"Install default ➔ use ➔ detect what's missing ➔ restore only that."*

Configurations must not be recovered automatically. Each component must prove its utility during live operations.

---

## 1. Directory & State Decoupling

Cryptographic keys, private configuration overlays, and stateful credentials reside in an external, isolated repository. Throughout the recovery steps, this private root is referenced via the environment variable `$KITCHEN_PATH`.

To verify variables before executing any step:

```bash
echo $KITCHEN_PATH
```

---

## 2. Dynamic Restoration Layers (Tiers)

Restoration is divided into dynamic conceptual layers to respect system dependencies and prevent privilege cross-contamination.

### Tier 1: Core Operating System Base (Headless-Compatible)

- Base packages (DNF), network tuning configurations, system services.
- This layer consists of GUI-independent utilities suitable for remote server environments.

### Tier 2: Cryptographic Identity (Late-Binding)

- Importation of GPG and SSH keys from the dynamic path:

  ```bash
  mkdir -p ~/.ssh && chmod 700 ~/.ssh
  cp "$KITCHEN_PATH"/<neutral-package>/ssh/id_ed25519 ~/.ssh/
  ```

### Tier 3: CLI & Shell Environments (Headless-Compatible)

- Symlinking base terminal dotfiles and initializing command-line tools.

### Tier 4: Graphical User Interface & Desktop Environment

- Importing window management configurations and custom keyboard shortcuts via `dconf`.
- System UI settings.

### Tier 5: Isolated Applications

- Deployment of isolated runtimes (Flatpaks) and importing respective application data profiles.
