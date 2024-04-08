#!/bin/sh

# List of packages to install
packages=(
    # general tools
    "fzf" "ripgrep" "neovim" "lazygit" "git" "tmux" "starship" "eza" "stow" "zsh"
    # kubernetes
    "k9s" "kubectl" "age" "sops" "flux"
    # languages
    "go"
    # mac tools
    "displayplacer"
)

casks=(
    # browser
    "vivaldi"
    # terminal
    "wezterm"
)

echo "Installing macOS Packages..."
brew install --cask "${casks[@]}"
brew install "${packages[@]}"
