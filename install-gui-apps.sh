#!/bin/bash

omarchy pkg add \
    keepassxc \
    dbeaver \
    libreoffice-fresh \
    libreoffice-fresh-de \
    intellij-idea-community-edition \
    discord

omarchy install browser brave-origin
omarchy install editor vscode
omarchy install service spotify

yay -S --noconfirm --needed \
    synology-drive