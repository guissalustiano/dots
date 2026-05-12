#!/usr/bin/env bash
set -e

## Nix installation
if command -v dnf >/dev/null; then
    sudo dnf install -y nix
    sudo systemctl enable --now nix-daemon
elif command -v pacman >/dev/null; then
    sudo pacman -S --noconfirm nix
    sudo systemctl enable --now nix-daemon
else
    curl -L https://nixos.org/nix/install | sh -s -- --daemon
fi

# Load nix into the current shell
. /etc/profile.d/nix.sh

## Install home manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
