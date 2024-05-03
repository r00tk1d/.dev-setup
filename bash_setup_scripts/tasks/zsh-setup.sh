#!/bin/bash

# Install Zsh
sudo apt update
sudo apt install -y zsh

# Change shell to Zsh
chsh -s $(which zsh)

# Check if Oh-My-Zsh directory exists WHY CHECK?
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    # Install Oh-My-Zsh
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh > ~/.oh-my-installer
    chmod +x ~/.oh-my-installer
    ~/.oh-my-installer
fi

# Install zsh-autosuggestions plugin
if [ ! -d "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
fi