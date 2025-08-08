#!/bin/bash

cd ~/.dev-setup/dotfiles

dconf dump / > gnome-settings-backup.bak

dconf load / < gnome-settings.ini

sudo timedatectl set-timezone Europe/Berlin

# preparation for the manual installation of "gnome vitals"
sudo apt install gnome-shell-extension-manager gir1.2-gtop-2.0 lm-sensors