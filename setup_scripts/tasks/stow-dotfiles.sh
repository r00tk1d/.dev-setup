#!/bin/bash

sudo apt-get -q install -y stow || handle_fail "stow" 

cd "$HOME/dev_setup/dotfiles"

if [[ `git status --porcelain` ]]; then
    handle_fail "stow-uncommited-changes-in-repo"
    echo "stow aborted. Uncommited changes in repo. Please commit or stash changes and try again!"
else
    # hack for overwrite existing dotfiles
    stow -v -t "$HOME" * --adopt
    git reset --hard
fi

cd "$HOME/dev_setup/setup_scripts/tasks"