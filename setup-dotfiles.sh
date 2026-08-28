#!/bin/bash

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

if ! command -v lnko &>/dev/null; then
    echo "Install lnko first"
    exit 1
fi

cd "$REPO_DIR/dotfiles"
lnko link *
