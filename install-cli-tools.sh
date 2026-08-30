#!/bin/bash

# Install terminal tools
# fzf: fuzzy finder | ripgrep: fast search | jq/gron: JSON | bat: cat clone
# zoxide: smarter cd | direnv: env vars per directory | navi: cheat sheets
# helix: editor | zellij: multiplexer | yazi: file manager | lazygit: git TUI
# wl-clipboard: Wayland clipboard | postgresql: psql client
omarchy pkg add \
    fzf \
    ripgrep \
    jq \
    gron \
    bat \
    zoxide \
    direnv \
    yazi \
    lazygit \
    lazydocker \
    wl-clipboard \
    postgresql \
    k9s \
    opencode
