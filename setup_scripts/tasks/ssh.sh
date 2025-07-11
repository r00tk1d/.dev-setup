#!/bin/bash

cd $HOME

if ! [[ -f ".ssh/id_ed25519" ]]; then
  mkdir -p .ssh 
  ssh-keygen -t ed25519 -f ".ssh/id_ed25519" -N "" -C "$USER@$HOSTNAME"

  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi

cd "$HOME/.dev-setup/setup_scripts/tasks"