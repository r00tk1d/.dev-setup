#!/bin/bash

sudo apt -q install -y gron || handle_fail "gron"
sudo apt -q install -y libreoffice-l10n-de || handle_fail "libreoffice-l10n-de"
sudo apt -q install -y keepassxc || handle_fail "keepassxc"