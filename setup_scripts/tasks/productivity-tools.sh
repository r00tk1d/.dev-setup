#!/bin/bash

sudo apt-get -q install -y gnome-tweak-tool || handle_fail "gnome-tweak-tool"
sudo apt-get -q install -y fzf || handle_fail "fzf"
sudo apt-get -q install -y xclip || handle_fail "xclip"
sudo apt-get -q install -y ripgrep || handle_fail "ripgrep"
sudo apt-get -q install -y jq || handle_fail "jq"
sudo apt-get -q install -y ranger || handle_fail "ranger"
sudo apt-get -q install -y gron || handle_fail "gron"
sudo apt-get -q install -y bat || handle_fail "bat"
sudo apt-get -q install -y z || handle_fail "zoxide"
sudo apt-get -q install -y wmctrl || handle_fail "wmctrl"
sudo apt-get -q install -y xdotool || handle_fail "xdotool"