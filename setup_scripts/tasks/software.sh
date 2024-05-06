#!/bin/bash

echo "starting task: software"

sudo apt -qq install -y gron || handle_fail "gron"
sudo apt -qq install -y libreoffice-l10n-de || handle_fail "libreoffice-l10n-de"
sudo apt -qq install -y keepassxc || handle_fail "keepassxc"


# TODO spotify, zoom, intellij
