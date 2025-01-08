#!/bin/bash

sudo apt-get -q install -y stow || handle_fail "stow" 

cd "$HOME/dev_setup/dotfiles"

# hack for overwrite existing dotfiles without loosing uncommited changes
git stash
stow -v -t "$HOME" */ --no-folding --adopt
git reset --hard
git stash pop


cd "$HOME/dev_setup/setup_scripts/tasks"