#!/bin/bash

sudo apt -qq install -y stow || handle_fail "stow" 

cd "$HOME/dev_setup/dotfiles"
stow -v -t "$HOME" *