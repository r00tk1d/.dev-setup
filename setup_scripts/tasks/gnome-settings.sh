#!/bin/bash

dconf load / < gnome-settings.ini

# "remove" the ubuntu dock
cd /usr/share/gnome-shell/extensions/
sudo mv ubuntu-dock@ubuntu.com{,.bak}

# get back the ubuntu dock
# cd /usr/share/gnome-shell/extensions/
# sudo mv ubuntu-dock@ubuntu.com{.bak,}