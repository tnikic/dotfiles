# Initialize apps
eval "$(mise activate zsh)"
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Source files
for f in $XDG_CONFIG_HOME/zsh/configs/*.sh; do source $f; done # Configs
for f in $XDG_CONFIG_HOME/zsh/apps/*.sh; do source $f; done # Apps
