# Dotfiles

This is my personal dotfiles repository. It is of course an ongoing project that will change over time. In this README you can find installation snippets that make it possible to install the configs with a few copy pastes.

## Packages

| basics   | development | devops         | macos         | languages | fonts                    |
| -------- | ----------- | -------------- | ------------- | --------- | ------------------------ |
| bat      | git         | docker         | brave-browser | node@20   | jetbrains-mono-nerd-font |
| eza      | lazygit     | kubernetes-cli | iina          | go        |                          |
| fd       | sqlite      | helm           | obsidian      | python    |                          |
| zoxide   | neovim      | k9s            | raycast       |           |                          |
| ripgrep  |             | terraform      | wezterm       |           |                          |
| zsh      |             |                | slack         |           |                          |
| starship |             |                | displayplacer |           |                          |
| tmux     |             |                |               |           |                          |
| fzf      |             |                |               |           |                          |
| stow     |             |                |               |           |                          |

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

First we need to install Homebrew. Execute the following command to do just that:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After we have installed Homebrew, it is time to prepare the system for the configs in this repo by installing the apps that I use them with (and more).

### Basic tools for the cli

```
brew install bat eza fd fzf git helm k9s kubernetes-cli lazygit neovim ripgrep sqlite starship stow terraform tmux zsh zoxide
```

### Language specific tools

```
brew install node@20 go python
```

### GUI apps

```
brew install --cask brave-browser docker iina obsidian raycast wezterm
```

### Fonts

```
brew install --cask font-jetbrains-mono-nerd-font
```

### Optional apps (that I have to use)

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
