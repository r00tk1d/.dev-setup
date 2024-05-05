#!/bin/bash


# TODO: basic idea. Needs refinement, testing. Should also work for updating intellij without loosing settings! Ideally import the settings.zip from .dotfiles here too!
# https://www.jetbrains.com/help/idea/installation-guide.html#mcfxm5_178
if ! [[ -d "/opt/ideaIC" ]]; then
    INSTALL_DIR="/opt"
    DOWNLOAD_LINK="https://download.jetbrains.com/idea/ideaIC-${INTELLIJ_VERSION}.tar.gz"
    INTELLIJ_DIR="/opt/idea-IC"

    wget -qO /tmp/intellij.tar.gz "${DOWNLOAD_LINK}"
    sudo tar -xzf /tmp/intellij.tar.gz -C /opt

    rm /tmp/intellij.tar.gz

    sudo ln -s "${INTELLIJ_DIR}/bin/idea.sh" /usr/local/bin/intellij
fi