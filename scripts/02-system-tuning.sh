#!/usr/bin/env bash
set -euo pipefail

# Sudo Keep-Alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# DNF Parallelism
sudo dnf config-manager setopt max_parallel_downloads=10 > /dev/null

# Kernel Power Profile
if command -v tuned-adm &> /dev/null; then
    sudo tuned-adm profile throughput-performance
fi
