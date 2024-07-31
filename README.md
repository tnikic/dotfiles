# Dotfiles

This is my personal dotfiles repository. It is of course an ongoing project that will change over time. In this README you can find installation snippets that make it possible to install the configs with a few copy pastes.

## Installation

Basic tools that I use on a daly basis.

| Name           | Category  | OS                |
| -------------- | --------- | ----------------- |
| bat            | basic     | `macOS`, `fedora` |
| eza            | basic     | `macOS`, `fedora` |
| fd             | basic     | `macOS`, `fedora` |
| fzf            | basic     | `macOS`, `fedora` |
| zoxide         | basic     | `macOS`, `fedora` |
| ripgrep        | basic     | `macOS`, `fedora` |
| git            | vcs       | `macOS`, `fedora` |
| lazygit        | vcs       | `macOS`, `fedora` |
| helm           | k8s       | `macOS`, `fedora` |
| k9s            | k8s       | `macOS`, `fedora` |
| kubernetes-cli | k8s       | `macOS`, `fedora` |
| neovim         | editor    | `macOS`, `fedora` |
| sqlite         | database  | `macOS`, `fedora` |
| zsh            | prompt    | `macOS`, `fedora` |
| starship       | prompt    | `macOS`, `fedora` |
| stow           | linking   | `macOS`, `fedora` |
| terraform      | devops    | `macOS`, `fedora` |
| tmux           | muxing    | `macOS`, `fedora` |
| docker         | container | `fedora`          |
| displayplacer  | display   | `macOS`           |

Langauges and tools needed for them.

| Name    | Language   | OS                |
| ------- | ---------- | ----------------- |
| node@20 | javascript | `macOS`, `fedora` |
| go      | golang     | `macOS`, `fedora` |
| python  | python     | `macOS`, `fedora` |
| gradle  | java       | `macOS`, `fedora` |
| maven   | java       | `macOS`, `fedora` |
| openjdk | java       | `macOS`, `fedora` |

Graphical UI apps (mostly relevant for macOS and windows).

| Name          | Category     | OS                 |
| ------------- | ------------ | ------------------ |
| brave-browser | browser      | `macOS`, `windows` |
| docker        | container    | `macOS`            |
| iina          | media player | `macOS`            |
| obsidian      | notes        | `macOS`, `windows` |
| raycast       | launcher     | `macOS`            |
| wezterm       | terminal     | `macOS`, `windows` |
| slack         | chat         | `macOS`, `windows` |

Fonts that are used in the terminal.

| Name                     | OS                 |
| ------------------------ | ------------------ |
| jetbrains-mono-nerd-font | `macOS`, `windows` |

## macOS installation

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
brew install bat eza fd fzf git helm k9s kubernetes-cli lazygit neovim ripgrep sops sqlite starship stow terraform tmux zsh zoxide
```

### Language specific tools

```
brew install node@20 go gradle maven openjdk python
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
