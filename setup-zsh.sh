#!/bin/bash

if ! command -v zsh &>/dev/null; then
    echo "Install zsh first"
    exit 1
fi

# Change default shell to zsh
omarchy-setup-zsh