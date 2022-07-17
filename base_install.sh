#! /bin/bash

# Disk
paru -S lshw btrfs-progs

# Basics
paru -S base base-devel which unzip zip xclip openssh

# Basics+
paru -S bat ripgrep tealdeer fd

# Audio
paru -S pipewere pipewire-pulse pipewire-alsa pipewire-jack

# Net
paru -S iwd wireless_tools

# Terminal
paru -S zsh oh-my-zsh

# Rust
paru -S rustup rust-analyzer 

# Fonts
paru -S nerd-fonts-fira-code \
  noto-fonts \
  noto-fonts-emoji \
  ttf-liberation \
  ttf-droid \
  adobe-source-sans-fonts \
  ttf-dejavu \
  ttf-ms-fonts

# windows manager
paru -S stack-static

stack setup
