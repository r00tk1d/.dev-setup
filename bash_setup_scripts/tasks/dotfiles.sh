#!/bin/bash

sudo apt -qq install -y stow || handle_fail "stow" 

git clone git@github.com:r00tk1d/.dotfiles.git "$HOME/.dotfiles"

cd "$HOME/.dotfiles" && source stow_dirs

for dir in "${STOW_DIRS[@]}"; do
    stow -v -R -t "$HOME" "$dir"
done