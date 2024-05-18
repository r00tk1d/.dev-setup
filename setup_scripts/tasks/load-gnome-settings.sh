#!/bin/bash

cd ~/dev_setup/dotfiles

dconf load / < gnome-settings.ini

sudo timedatectl set-timezone Europe/Berlin