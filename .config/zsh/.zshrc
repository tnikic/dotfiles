# Initialize apps
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Configs
source "$XDG_CONFIG_HOME/zsh/configs/zsh.sh" # ZSH
source "$XDG_CONFIG_HOME/zsh/configs/aliases.sh" # Aliases
source "$XDG_CONFIG_HOME/zsh/configs/cursor.sh" # Cursor
source "$XDG_CONFIG_HOME/zsh/configs/fzf.sh" # Fuzzy search

# Plugins
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
