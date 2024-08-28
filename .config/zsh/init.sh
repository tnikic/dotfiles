# Initialize apps
eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Source files
for f in $XDG_CONFIG_HOME/zsh/configs/*.sh; do source $f; done # Configs
for f in $XDG_CONFIG_HOME/zsh/apps/*.sh; do source $f; done # Apps

# Plugins
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$XDG_CONFIG_HOME/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
