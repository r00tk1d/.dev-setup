#!/bin/bash

sudo apt-get -q install -y libreoffice libreoffice-l10n-de libreoffice-help-de || handle_fail "libreoffice"
sudo apt-get -q install -y keepassxc || handle_fail "keepassxc"
sudo apt-get -q install -y gedit || handle_fail "gedit"
sudo snap install spotify || handle_fail "spotify"
sudo snap install --classic code || handle_fail "vscode"
sudo snap install brave || handle_fail "brave-browser"