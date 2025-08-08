#!/bin/bash

# Prompt for name and email
read -p "Enter your name (for git): " NAME
read -p "Enter your email (for git): " MAIL
read -p "Enter your jira base url (for zsh jira extension): " JIRA
read -p "Install Intellij Ultimate (U) or Intellij Community (C): " INTELLIJ_CHOICE

# Export variables for the current session
export NAME
export MAIL
export JIRA
export INTELLIJ_CHOICE

echo "Set NAME, MAIL, JIRA and INTELLIJ_CHOICE for this session."