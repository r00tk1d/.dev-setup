#!/bin/bash

# sudo apt -q install -y tmux || handle_fail "tmux"
sudo apt -q install -y fzf || handle_fail "fzf"
sudo apt -q install -y xclip || handle_fail "xclip"
# sudo apt -q install -y tldr || handle_fail "tldr"
sudo apt -q install -y ripgrep || handle_fail "ripgrep"
sudo apt -q install -y jq || handle_fail "jq"
sudo apt -q install -y ranger || handle_fail "ranger"
sudo apt -q install -y gron || handle_fail "gron"
sudo apt -q install -y bat || handle_fail "bat"