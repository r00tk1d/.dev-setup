#!/bin/bash

sudo apt -qq install -y stow || handle_fail "stow" 

cd "$HOME/dev_setup/dotfiles"

if [[ `git status --porcelain` ]]; then
    handle_fail "stow-uncommited-changes-in-repo"
else
    # hack for overwrite existing dotfiles
    stow -v -t "$HOME" * --adopt
    git reset --hard
fi