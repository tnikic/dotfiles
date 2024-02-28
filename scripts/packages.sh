#!/bin/sh

# List of packages to install
packages=(
    # general tools
    "fzf" "ripgrep" "neovim" "lazygit" "git" "tmux" "starship" "eza" "stow"
    # kubernetes
    "k9s" "kubectl" "age" "sops" "flux"
    # languages
    "go"
)

linux=()

macos=(
    "displayplacer" "zsh"
)

casks=(
    "vivaldi" "wezterm"
)

if ! is_brew_installed; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    BREW_PATH=$(which brew)
    eval "$($BREW_PATH shellenv)"
fi

echo "Installing general Packages..."
brew install "${packages[@]}"


if is_macos; then
    echo "Installing macOS Packages..."
    brew install "${macos[@]}"
    brew install --cask "${casks[@]}"
elif is_linux; then
    echo "Installing Linux Packages..."
    # brew install "${linux[@]}"

    echo "Installing zsh"
    sudo apt update
    sudo apt install zsh
    sudo chsh -s /bin/zsh tomislav
fi
