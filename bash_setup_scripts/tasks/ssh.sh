#!/bin/bash

cd $HOME

if ! [[ -f ".ssh/id_ed25519" ]]; then
  mkdir -p .ssh 
  ssh-keygen -t ed25519 -f ".ssh/id_ed25519" -N "" -C "$USER@$HOST"
fi