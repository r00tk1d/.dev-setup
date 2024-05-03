#!/bin/bash


# TODO: basic idea. Needs refinement, testing. Should also work for updating intellij without loosing settings! Ideally import the settings.zip from .dotfiles here too!
read -p "Enter the IntelliJ version: " INTELLIJ_VERSION

INSTALL_DIR="/opt"
DOWNLOAD_LINK="https://download.jetbrains.com/idea/ideaIU-${INTELLIJ_VERSION}.tar.gz"
INTELLIJ_DIR="${INSTALL_DIR}/idea-IU-${INTELLIJ_VERSION}"

wget -qO /tmp/intellij.tar.gz "${DOWNLOAD_LINK}"

echo "Extracting IntelliJ IDEA..."
sudo tar xf /tmp/intellij.tar.gz -C "${INSTALL_DIR}"

rm /tmp/intellij.tar.gz

sudo ln -s "${INTELLIJ_DIR}/bin/idea.sh" /usr/local/bin/intellij