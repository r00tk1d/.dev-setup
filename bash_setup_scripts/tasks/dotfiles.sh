#!/bin/bash

echo "starting task: dotfiles"

sudo apt update
sudo apt install -y stow

git clone git@github.com:r00tk1d/.dotfiles.git "$HOME/.dotfiles"

cd "$HOME/.dotfiles" && ./ubuntu
DOTFILE_DIRS=("zsh" "scripts")

for dir in "${DOTFILE_DIRS[@]}"; do
    stow -v -R -t "$HOME" "$dir"
done

echo "finished task: dotfiles"