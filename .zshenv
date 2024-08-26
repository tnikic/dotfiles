# XDG paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# ZSH configuration
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$XDG_CACHE_HOME/history"
export HISTSIZE=10000
export SAVEHIST=10000
export SHELL_SESSIONS_DISABLE=1

# Basics
export EDITOR="nvim"
export VISUAL="nvim"

# Golang
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"

# Node
export PATH="$PATH:/opt/homebrew/opt/node@20/bin"

# Other
export PATH="$PATH:$XDG_CONFIG_HOME/tmux/plugins/tmuxifier/bin" # Tmux
export DOCKER_CONFIG="$XDG_DATA_HOME/docker" # Docker
export LESSHISTFILE=- # Less
export VIMINFO="/dev/null" # Vim
