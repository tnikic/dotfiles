if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

source "/opt/homebrew/opt/fzf/shell/completion.zsh" # Autocompletion
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh" # Key bindings
