#!/bin/sh

source ./scripts/checks.sh
source ./scripts/packages.sh

# Check for OS
if is_macos; then
    STOW_FOLDER="mac"
elif is_linux; then
    STOW_FOLDER="linux"
else
    echo "Unsupported operating system: $(uname)"
    exit 1
fi

# Create folders
mkdir -p ~/.config
mkdir -p ~/.local/share
mkdir -p ~/.cache

# General links
stow -t ~ "general"
echo "Stow completed for general apps"

# System specific links
stow -t ~ "$STOW_FOLDER"
echo "Stow completed for $STOW_FOLDER on $(uname) system."
