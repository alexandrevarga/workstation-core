#!/usr/bin/env bash
set -euo pipefail

# Sudo Keep-Alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# 1. DNF Parallel Downloads
sudo dnf config-manager --save --setopt=max_parallel_downloads=10 > /dev/null

# 2. Kernel Power Profile
if command -v powerprofilesctl &> /dev/null; then
    powerprofilesctl set performance || true
fi
