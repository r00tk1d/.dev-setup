#!/bin/bash

sudo apt-get -q install -y stow || handle_fail "stow" 

cd "$HOME/.dev-setup/dotfiles"

# hack for overwrite existing dotfiles
if [ -n "$(git status --porcelain)" ]; then
  echo "There are uncommitted changes. Please commit or stash them before stowing dotfiles."
  handle_fail "stow_dotfiles"
else
  stow -v -t "$HOME" */ --no-folding --adopt
  git restore .
fi


cd "$HOME/.dev-setup/setup_scripts/tasks"