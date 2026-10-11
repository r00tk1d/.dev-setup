#!/bin/bash

set -e

SSH_DIR="$HOME/.ssh"

if ! command -v ssh-keygen &>/dev/null; then
    echo "ssh-keygen not found. Install openssh first."
    exit 1
fi

mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

read -rp "Key name: " key_name

KEY_FILE="$SSH_DIR/$key_name"

if [ -f "$KEY_FILE" ]; then
    echo "Key already exists at $KEY_FILE"
    echo ""
    echo "Public key:"
    cat "$KEY_FILE.pub"
    exit 0
fi

ssh-keygen -t ed25519 -N "" -C "$key_name" -f "$KEY_FILE"

chmod 600 "$KEY_FILE"
chmod 644 "$KEY_FILE.pub"

echo ""
echo "Public key:"
cat "$KEY_FILE.pub"
