# Friction Log

| Date | Symptom | Resolution | Component |
| :--- | :--- | :--- | :--- |
| 2026-07-13 | Missing orchestration dependencies (`make`, `stow`) on a pristine host. | Implemented `bootstrap.sh` to install base binaries via DNF. | `bootstrap` |
| 2026-07-13 | Default GNOME light theme causes eye strain. | Implemented `scripts/01-desktop-ux.sh` to force `prefer-dark` scheme via gsettings. | `desktop` |
| 2026-07-13 | DNF default download limits slow package operations, and default power governors throttle host AC performance. | Enabled parallel DNF downloads and set throughput-performance profile in `scripts/02-system-tuning.sh`. | `system` |
