# Friction Log

| Date | Symptom | Resolution | Component |
| :--- | :--- | :--- | :--- |
| 2026-07-13 | Missing orchestration dependencies (`make`, `stow`) on a pristine host. | Implemented `bootstrap.sh` to install base binaries via DNF. | `bootstrap` |
| 2026-07-13 | Default GNOME light theme causes eye strain. | Implemented `scripts/01-desktop-ux.sh` to force `prefer-dark` scheme via gsettings. | `desktop` |
