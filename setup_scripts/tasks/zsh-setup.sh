#!/bin/bash

sudo apt -qq install -y zsh || handle_fail "zsh"

# Change shell to Zsh
chsh -s $(which zsh)

# Install Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh > ~/.oh-my-installer
    chmod +x ~/.oh-my-installer
    ~/.oh-my-installer
fi

# Install zsh-autosuggestions plugin
if [ ! -d "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
fi