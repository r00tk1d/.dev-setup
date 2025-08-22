#!/bin/bash

git config --global user.name "$NAME"
git config --global user.email "$MAIL"
git config --global commit.template ~/.git-commit-message-template.txt

mkdir ~/.githooks
git config --global core.hooksPath ~/.githooks

git config --global alias.uncommit "reset HEAD~1"
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset-%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"