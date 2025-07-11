#!/bin/bash

if [[ "$INTELLIJ_CHOICE" == "u" ]]; then
    sudo snap install intellij-idea-ultimate --classic || handle_fail "intellij-ultimate"
elif [[ "$INTELLIJ_CHOICE" == "c" ]]; then
    sudo snap install intellij-idea-community --classic || handle_fail "intellij-community"
else
    echo "Invalid choice: '$INTELLIJ_CHOICE'. Please enter 'u' for Ultimate or 'c' for Community."
    handle_fail "intellij"
fi