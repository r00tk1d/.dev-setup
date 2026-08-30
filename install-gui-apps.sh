#!/bin/bash

# Install GUI applications
# brave: browser | keepassxc: passwords | dbeaver: DB client
# libreoffice-fresh(-de): office suite with German language pack
# intellij-idea-ultimate-edition: unified IntelliJ IDEA (AUR, bundles JetBrains
#   Runtime -> native Wayland); Ultimate features unlock with a subscription,
#   otherwise fully functional free tier
# visual-studio-code-bin / spotify from AUR
omarchy pkg add \
    synology-drive \
    brave-origin-bin \
    keepassxc \
    dbeaver \
    libreoffice-fresh \
    libreoffice-fresh-de \
    intellij-idea-ultimate-edition \
    visual-studio-code-bin \
    spotify
