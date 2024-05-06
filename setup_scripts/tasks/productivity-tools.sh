#!/bin/bash

# sudo apt -qq install -y tmux || handle_fail "tmux"
sudo apt -qq install -y fzf || handle_fail "fzf"
sudo apt -qq install -y xclip || handle_fail "xclip"
# sudo apt -qq install -y tldr || handle_fail "tldr"
sudo apt -qq install -y ripgrep || handle_fail "ripgrep"
sudo apt -qq install -y jq || handle_fail "jq"
sudo apt -qq install -y ranger || handle_fail "ranger"
sudo apt -qq install -y gron || handle_fail "gron"
sudo apt -qq install -y bat || handle_fail "bat"