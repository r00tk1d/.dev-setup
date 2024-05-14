#!/bin/bash

# sudo apt-get -q install -y tmux || handle_fail "tmux"
sudo apt-get -q install -y fzf || handle_fail "fzf"
sudo apt-get -q install -y xclip || handle_fail "xclip"
# sudo apt-get -q install -y tldr || handle_fail "tldr"
sudo apt-get -q install -y ripgrep || handle_fail "ripgrep"
sudo apt-get -q install -y jq || handle_fail "jq"
sudo apt-get -q install -y ranger || handle_fail "ranger"
sudo apt-get -q install -y gron || handle_fail "gron"
sudo apt-get -q install -y bat || handle_fail "bat"