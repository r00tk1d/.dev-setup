#!/bin/bash

cd ~/dev_setup/dotfiles

dconf dump / > gnome-settings-backup.bak

dconf load / < gnome-settings.ini

sudo timedatectl set-timezone Europe/Berlin