#!/bin/bash

# Prompt for name and email
read -p "Install Intellij Ultimate (U) or Intellij Community (C): " INTELLIJ_CHOICE

# Export variables for the current session
export INTELLIJ_CHOICE

echo "Set INTELLIJ_CHOICE for this session."