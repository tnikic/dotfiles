# Dotfiles

This is my personal dotfiles repository. It is of course an ongoing project that will change over time. In this README you can find installation snippets that make it possible to install the configs with a few copy pastes.

## Installation

First we need to install Homebrew. Execute the following command inside the standard terminal app to do just that:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After the installation, you will need to register the brew command so that it is acutally usable. This following command makes a temporary fix which is enough, since the permanent fix is inside the `.zshrc` file.
Execute the following:

```
eval "$(/opt/homebrew/bin/brew shellenv)"
```

After we have installed Homebrew, it is time to prepare the system for the configs in this repo by installing the apps that I use them with (and more).

### Basic tools

```
brew install eza fzf git lazygit neovim starship stow zsh zoxide
```

### GUI apps

#### Daily
```
brew install --cask google-chrome docker iina obsidian wezterm bitwarden microsoft-office-businesspro windows-app
```

#### Languages
```
brew install go node@22
```

#### Development
```
brew install --cask jetbrains-toolbox visual-studio-code autodesk-fusion firefox@developer-edition
```

### Fonts

```
brew install --cask font-jetbrains-mono-nerd-font
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
