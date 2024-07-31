# Dotfiles

# macOS installation

First we need to install Homebrew. Execute the following command to do just that:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After we have installed Homebrew, it is time to prepare the system for the configs in this repo by installing the apps that I use them with (and more).

## Basic tools for the cli

```
brew install bat eza fd fzf git helm k9s kubernetes-cli lazygit neovim ripgrep sops sqlite starship stow terraform tmux zsh zoxide
```

## Language specific tools

```
brew install node@20 go gradle maven openjdk python
```

## GUI apps

```
brew install --cask brave-browser docker iina obsidian raycast wezterm
```

## Fonts

```
brew install --cask font-jetbrains-mono-nerd-font
```

## Optional apps (that I have to use)

```
brew install --cask slack displayplacer
```

# Cloning the config files

```
ssh-keygen -t ed25519 -C "NAME"
```

```
pbcopy < ~/.ssh/id_ed25519.pub
```

Put the new key into github

```
git clone git@github.com:tnikic/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && git submodule update --init --recursive
```

```
mkdir -p ~/.config ~/.local ~/.cache
cd ~/.dotfiles && stow .
```
