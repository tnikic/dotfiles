# Main variables
export EDITOR=nvim

# PATH extensions
export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH"

# Initialize apps
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# ZSH configuration
source ~/.config/zsh/fzf.zsh

# Aliases
alias ll="eza -la --group-directories-first"
alias ls="eza --group-directories-first"
alias cd="z"
alias lg="lazygit"

# move history to cache
export HISTFILE=~/.cache/zsh/history

# disable viminfo
export VIMINFO=/dev/null

# disable lesshistory
export LESSHISTFILE=-

# move go folder to local/share
export GOPATH=$HOME/.local/share/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

# move zsh_sessions to cache
export ZSH_SESSIONS_DIR=$HOME/.cache/zsh/sessions

# move the docker folder to local/share
export DOCKER_CONFIG=$HOME/.local/share/docker

# Using Node FNM
eval "$(fnm env --use-on-cd)"
