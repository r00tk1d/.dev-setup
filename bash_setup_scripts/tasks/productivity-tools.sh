#!/bin/bash

echo "starting task: productivity-tools"

sudo apt update
sudo apt install -y tmux fzf xclip tldr ripgrep jq ranger gron

echo "finished task: productivity-tools"