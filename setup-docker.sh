#!/bin/bash

if ! command -v docker &>/dev/null; then
    echo "Install docker first"
    exit 1
fi

sudo systemctl enable --now docker
