#!/bin/bash

set -e

SSH_DIR="$HOME/.ssh"
KEY_FILE="$SSH_DIR/id_ed25519"

if ! command -v ssh-keygen &>/dev/null; then
    echo "ssh-keygen not found. Install openssh first."
    exit 1
fi

if [ -f "$KEY_FILE" ]; then
    echo "SSH key already exists at $KEY_FILE"
    echo ""
    echo "Public key:"
    cat "$KEY_FILE.pub"
    echo ""
    exit 0
fi

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

ssh-keygen -t ed25519 -N "" -f "$KEY_FILE"

chmod 600 "$KEY_FILE"
chmod 644 "$KEY_FILE.pub"

echo ""
echo "Public key:"
cat "$KEY_FILE.pub"
echo ""
