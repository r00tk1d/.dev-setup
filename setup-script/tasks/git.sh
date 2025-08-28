#!/bin/bash

# TODO cleanup and preferably use a gitconfig dotfile instead

git config --global user.name "$NAME"
git config --global user.email "$MAIL"
git config --global commit.template ~/.git-commit-message-template.txt

mkdir ~/.githooks
git config --global core.hooksPath ~/.githooks

git config --global alias.uncommit "reset HEAD~1"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset-%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/