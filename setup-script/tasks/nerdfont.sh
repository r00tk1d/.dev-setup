#!/bin/bash
mkdir -p ~/.fonts
cd ~/.fonts
# JetBrainsMono Nerd Font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
unzip JetBrainsMono.zip
fc-cache -fv

# -> set Font in Terminal