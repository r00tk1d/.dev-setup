#!/bin/bash
set -x

DOTFILES_GNOME_DIR="$(cd "$(dirname "$0")" && pwd)"   # absolute path to dotfiles-gnome

dconf dump / > $DOTFILES_GNOME_DIR/gnome-settings-backup.bak
dconf load / < $DOTFILES_GNOME_DIR/gnome-settings.ini
sudo timedatectl set-timezone Europe/Berlin

# preparation for the manual installation of "gnome vitals"
sudo apt install gnome-shell-extension-manager gir1.2-gtop-2.0 lm-sensors

echo "Logging out to apply settings..."
sleep 3
gnome-session-quit