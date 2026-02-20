#!/usr/bin/env bash

set -euo pipefail

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/tnikic/dotfiles.git}"

echo "==> Ensure pacman uses colors"
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf

echo "==> Ensure system and keyring are up to date"
sudo pacman -Sy --noconfirm --needed archlinux-keyring
sudo pacman -Syu --noconfirm

echo "==> Installing yay (AUR helper) non-interactively"
if ! command -v yay >/dev/null 2>&1; then
    sudo pacman -S --noconfirm --needed base-devel git
    tmpdir="$(mktemp -d)"
    git clone https://aur.archlinux.org/yay-bin.git "$tmpdir/yay-bin"
    pushd "$tmpdir/yay-bin" >/dev/null
    makepkg -sri --noconfirm
    popd >/dev/null
    rm -rf "$tmpdir"
else
    echo "==> yay already installed"
fi

# Package list
PACKAGES=(
    # Core system
    bluez
    networkmanager
    openssh
	libfido2

    # GNOME Base
    gnome-shell
    gnome-control-center
    gdm

    # GNOME apps
    baobab
    gnome-backgrounds
    gnome-calculator
    gnome-calendar
    gnome-clocks
    gnome-color-manager
    gnome-connections
    gnome-contacts
    gnome-disk-utility
    gnome-font-viewer
    gnome-keyring
    gnome-menus
    gnome-session
    gnome-settings-daemon
    gnome-system-monitor
    gnome-weather
    loupe
    nautilus
    sushi
    xdg-desktop-portal-gnome

    # GNOME Extra
    extension-manager
    gnome-tweaks

    # Audio
    pipewire
    wireplumber
    pipewire-alsa
    pipewire-pulse
    pipewire-jack

    # Fonts
    inter-font
    noto-fonts
    noto-fonts-emoji
    ttf-jetbrains-mono-nerd

    # CLI tools
    git
    curl
    unzip
    zip
    zsh
    man-db
    mise
    chezmoi

    # Apps
	xournalpp
    ghostty
    vivaldi
    teams-for-linux-bin
    libreoffice-fresh
    libreoffice-fresh-de
    thunderbird

    # Dev tools
    docker
    docker-compose
)

echo "==> Installing packages via yay (repo + AUR)"
yay -S \
    --noconfirm \
    --sudoloop \
    --needed \
    "${PACKAGES[@]}"

echo "==> Installing devpod"
curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && sudo install -c -m 0755 devpod /usr/local/bin && rm -f devpod

echo "==> Enable Network and Bluetooth"
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth

echo "==> Enable SSH server"
sudo systemctl enable sshd

echo "==> Enable GDM"
sudo systemctl enable gdm

echo "==> Remove unnecessary .desktop files from GNOME application menu"
UNWANTED_DESKTOP_FILES=(
    "qv4l2.desktop"
    "qvidcap.desktop"
    "bssh.desktop"
    "bvnc.desktop"
    "avahi-discover.desktop"
    "nvim.desktop"
)

for file in "${UNWANTED_DESKTOP_FILES[@]}"; do
    desktop_file_path="/usr/share/applications/$file"
    if [[ -f "$desktop_file_path" ]]; then
        echo "Removing $file"
        sudo rm -f "$desktop_file_path"
    else
        echo "$file does not exist, skipping"
    fi
done

echo "==> Setting up SSH key from YubiKey"
SSH_DIR="$HOME/.ssh"
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

# Check if key already exists
if [[ ! -f "$SSH_DIR/id_ed25519_sk_rk_"* ]]; then
    echo "==> Please insert your YubiKey and touch it when it blinks..."
    echo "==> Extracting resident SSH key from YubiKey"

    # Extract the key to current directory first
    ssh-keygen -K

    # Find the extracted key (it will be named id_ed25519_sk_rk_*)
    EXTRACTED_KEY=$(ls id_ed25519_sk_rk_* 2>/dev/null | grep -v '\.pub$' | head -n1)

    if [[ -n "$EXTRACTED_KEY" ]]; then
        # Move the extracted keys to .ssh directory
        mv "$EXTRACTED_KEY" "$SSH_DIR/"
        mv "${EXTRACTED_KEY}.pub" "$SSH_DIR/"

        # Fix permissions
        chmod 600 "$SSH_DIR/$EXTRACTED_KEY"
        chmod 644 "$SSH_DIR/${EXTRACTED_KEY}.pub"

        echo "==> SSH key extracted: $EXTRACTED_KEY"
    else
        echo "ERROR: Failed to extract key from YubiKey"
        echo "Please ensure your YubiKey is inserted and contains a resident key"
        exit 1
    fi
else
    echo "==> SSH key already exists, skipping extraction"
fi

echo "==> Initialize and apply dotfiles with chezmoi"
CHEZMOI_SOURCE_DIR="$HOME/.local/share/chezmoi"

if [[ -d "$CHEZMOI_SOURCE_DIR/.git" ]]; then
    echo "==> Chezmoi already initialized, updating..."
    chezmoi update --force
else
    echo "==> Initializing chezmoi from repository..."
    chezmoi init --apply "$DOTFILES_REPO"
fi

echo "==> Installing CLI tools via mise"
# mise will read from .config/mise/config.toml managed by chezmoi
mise install

echo "==> Set default shell to zsh"
if command -v zsh >/dev/null 2>&1; then
    ZSH_PATH="$(command -v zsh)"
    if [[ "${SHELL:-}" != "$ZSH_PATH" ]]; then
        sudo chsh -s "$ZSH_PATH" "$USER" || echo "WARN: chsh failed; run: sudo chsh -s \"$ZSH_PATH\" \"$USER\""
    fi
    # Clean bash configs after migrating fully to zsh
    rm -f "$HOME/.bashrc" "$HOME/.bash_profile" "$HOME/.bash_logout" "$HOME/.bash_history" || true
else
    echo "WARN: zsh not found in PATH"
fi

cat <<'EOF'

==> Done.

EOF
