#!/bin/sh

source ./packages.sh

# Create folders
mkdir -p ~/.config
mkdir -p ~/.local/share
mkdir -p ~/.cache

# Install TPM (Tmux Plugin Manager)
git clone https://github.com/tmux-plugins/tpm ~/.local/share/tmux/plugins/tpm

# Stow
stow -t ~ "macos"
echo "Stow completed for general apps"
