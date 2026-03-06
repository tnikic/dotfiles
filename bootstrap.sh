#!/usr/bin/env bash
set -euo pipefail

DOTFILES_REPO="${DOTFILES_REPO:-https://github.com/tnikic/dotfiles.git}"
DOTFILES_REPO_SSH="${DOTFILES_REPO_SSH:-git@github.com:tnikic/dotfiles.git}"

log() { printf '==> %s\n' "$*"; }

# -----------------------------------------------------------------------------
# Pacman
# -----------------------------------------------------------------------------
log "Ensure pacman uses colors"
if ! grep -qE '^[[:space:]]*Color\b' /etc/pacman.conf; then
  sudo sed -i 's/^[[:space:]]*#\s*Color\s*$/Color/' /etc/pacman.conf || true
else
  log "pacman colors already enabled"
fi

log "Ensure system and keyring are up to date"
sudo pacman -Sy --noconfirm --needed archlinux-keyring
sudo pacman -Syu --noconfirm

# -----------------------------------------------------------------------------
# AUR helper (yay)
# -----------------------------------------------------------------------------
log "Installing yay (AUR helper) non-interactively"
if ! command -v yay >/dev/null 2>&1; then
  sudo pacman -S --noconfirm --needed base-devel git
  tmpdir="$(mktemp -d)"
  git clone https://aur.archlinux.org/yay-bin.git "$tmpdir/yay-bin"
  pushd "$tmpdir/yay-bin" >/dev/null
  makepkg -sri --noconfirm
  popd >/dev/null
  rm -rf "$tmpdir"
else
  log "yay already installed"
fi

# -----------------------------------------------------------------------------
# Packages (repo + AUR)
# -----------------------------------------------------------------------------
BASE=(
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
  papers
  gnome-backgrounds
  gnome-calculator
  gnome-calendar
  gnome-clocks
  gnome-color-manager
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

  # Zsh extras
  zsh-syntax-highlighting

  # Apps
  vivaldi
  ghostty
  libreoffice-fresh
  libreoffice-fresh-de
  thunderbird

  # Dev tools
  docker
  docker-compose
)

ADDITIONAL=(
  # University
  obsidian
  remmina
  teams-for-linux-bin
  zotero-bin
  zoom

  # 3D Printing
  orca-slicer-bin
)

log "Installing packages via yay (skips already-installed packages)"
yay -S --noconfirm --sudoloop --needed "${BASE[@]}"

log "Installing additional packages via yay (skips already-installed packages)"
yay -S --noconfirm --sudoloop --needed "${ADDITIONAL[@]}"

# -----------------------------------------------------------------------------
# DevPod
# -----------------------------------------------------------------------------
log "Installing devpod"
if ! command -v devpod >/dev/null 2>&1; then
  tmpfile="$(mktemp)"
  curl -fsSL -o "$tmpfile" "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64"
  sudo install -c -m 0755 "$tmpfile" /usr/local/bin/devpod
  rm -f "$tmpfile"
else
  log "devpod already installed"
fi

# -----------------------------------------------------------------------------
# Services
# -----------------------------------------------------------------------------
log "Enable Network and Bluetooth"
sudo systemctl enable --now NetworkManager
sudo systemctl enable --now bluetooth

log "Enable SSH server"
sudo systemctl enable --now sshd

log "Enable GDM"
sudo systemctl enable --now gdm

log "Enable Docker"
sudo systemctl enable --now docker

# -----------------------------------------------------------------------------
# Add docker to user
# -----------------------------------------------------------------------------
sudo usermod -a -G docker $USER

# -----------------------------------------------------------------------------
# GNOME application menu cleanup
# -----------------------------------------------------------------------------
log "Remove unnecessary .desktop files from GNOME application menu"
UNWANTED_DESKTOP_FILES=(
  "qv4l2.desktop"
  "qvidcap.desktop"
  "qdbusviewer.desktop"
  "lstopo.desktop"
  "assistant.desktop"
  "linguist.desktop"
  "designer.desktop"
  "bssh.desktop"
  "bvnc.desktop"
  "avahi-discover.desktop"
  "nvim.desktop"
)

for file in "${UNWANTED_DESKTOP_FILES[@]}"; do
  desktop_file_path="/usr/share/applications/$file"
  if [[ -f "$desktop_file_path" ]]; then
    log "Removing $file"
    sudo rm -f "$desktop_file_path"
  else
    log "$file does not exist, skipping"
  fi
done

# -----------------------------------------------------------------------------
# Dotfiles (chezmoi)
# -----------------------------------------------------------------------------
log "Initialize and apply dotfiles with chezmoi"
CHEZMOI_SOURCE_DIR="$HOME/.local/share/chezmoi"

if [[ -d "$CHEZMOI_SOURCE_DIR/.git" ]]; then
  log "Chezmoi already initialized."
else
  log "Initializing chezmoi from repository..."
  chezmoi init --apply "$DOTFILES_REPO"
fi

chezmoi git remote set-url origin $DOTFILES_REPO_SSH

# -----------------------------------------------------------------------------
# mise
# -----------------------------------------------------------------------------
log "Installing CLI tools via mise"
mise install

# -----------------------------------------------------------------------------
# Default shell
# -----------------------------------------------------------------------------
log "Set default shell to zsh"
if command -v zsh >/dev/null 2>&1; then
  ZSH_PATH="$(command -v zsh)"
  if [[ "${SHELL:-}" != "$ZSH_PATH" ]]; then
    sudo chsh -s "$ZSH_PATH" "$USER" || echo "WARN: chsh failed; run: sudo chsh -s \"$ZSH_PATH\" \"$USER\""
  else
    log "Default shell already set to zsh"
  fi

  rm -f "$HOME/.bashrc" "$HOME/.bash_profile" "$HOME/.bash_logout" "$HOME/.bash_history" || true
else
  echo "WARN: zsh not found in PATH" >&2
fi

cat <<'EOF'

==> Done.

EOF
