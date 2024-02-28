#!/bin/sh

is_macos() {
    [[ $(uname) == "Darwin" ]]
}

is_linux() {
    [[ $(uname) == "Linux" ]]
}

is_brew_installed() {
    command -v brew &> /dev/null
}

is_nix_installed() {
    command -v nix-env &> /dev/null
}
