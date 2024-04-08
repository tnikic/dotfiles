# Main variables
export EDITOR=nvim

# PATH extensions
export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH"

# Initialize apps
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"

# ZSH configuration
source ~/.config/zsh/fzf.zsh

# Aliases
alias ll="eza -la --group-directories-first"
alias ls="eza --group-directories-first"

# move history to cache
export HISTFILE=~/.cache/zsh/history

# disable viminfo
export VIMINFO=/dev/null

# disable lesshistory
export LESSHISTFILE=-

# move go folder to local/share
export GOPATH=$HOME/.local/share/go

# move zsh_sessions to cache
export ZSH_SESSIONS_DIR=$HOME/.cache/zsh/sessions

# move the docker folder to local/share
export DOCKER_CONFIG=$HOME/.local/share/docker
