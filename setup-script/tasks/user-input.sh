#!/bin/bash

# Prompt for name and email
read -p "Enter your jira base url (for zsh jira extension): " JIRA
read -p "Install Intellij Ultimate (U) or Intellij Community (C): " INTELLIJ_CHOICE

# Export variables for the current session
export JIRA
export INTELLIJ_CHOICE

echo "Set JIRA and INTELLIJ_CHOICE for this session."