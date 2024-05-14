#!/bin/bash

sudo apt-get -q install -y gron || handle_fail "gron"
sudo apt-get -q install -y libreoffice-l10n-de || handle_fail "libreoffice-l10n-de"
sudo apt-get -q install -y keepassxc || handle_fail "keepassxc"