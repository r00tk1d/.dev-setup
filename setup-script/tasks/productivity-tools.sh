#!/bin/bash

sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix
sudo apt-get -q install -y gnome-tweak-tool || handle_fail "gnome-tweak-tool" # UI tool to customize GNOME desktop
sudo apt-get -q install -y fzf || handle_fail "fzf" # Fuzzy finder for the command line
sudo apt-get -q install -y xclip || handle_fail "xclip" # clipboard command line utility
sudo apt-get -q install -y ripgrep || handle_fail "ripgrep" # Fast recursive search tool (like grep but better)
sudo apt-get -q install -y jq || handle_fail "jq" # Lightweight and flexible JSON processor
sudo apt-get -q install -y gron || handle_fail "gron" # Transforms JSON into grep-friendly format
sudo apt-get -q install -y bat || handle_fail "bat" # Cat clone with syntax highlighting and Git integration
sudo apt-get -q install -y z || handle_fail "zoxide" # Smarter cd command (quick directory jumping)
sudo apt-get -q install -y wmctrl || handle_fail "wmctrl" # Command-line tool to interact with X window manager
sudo apt-get -q install -y xdotool || handle_fail "xdotool" # Simulate keyboard/mouse input and window management
bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install) || handle_fail "navi"  # Command-line cheat sheet manager
sudo apt-get -q install -y postgresql-client || handle_fail "postgresql-client" # Client for postgres DBs
sudo snap install yazi --classic # terminal file manager TODO snap install puts the dotfiles in another location! Change to other installation method
cargo install --locked zellij