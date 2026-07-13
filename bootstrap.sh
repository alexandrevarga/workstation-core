#!/usr/bin/env bash
set -euo pipefail

# Sudo Keep-Alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo dnf upgrade -y
sudo dnf install -y make stow git
