#!/bin/bash

if [ ! -d /opt/idea-IC-* ]; then
    DOWNLOAD_LINK="https://download.jetbrains.com/idea/ideaIC-${INTELLIJ_VERSION}.tar.gz"

    wget -O /tmp/intellij.tar.gz "${DOWNLOAD_LINK}"
    sudo tar -xzf /tmp/intellij.tar.gz -C /opt

    rm /tmp/intellij.tar.gz

    sudo ln -s /opt/idea-IC-*/bin/idea.sh /usr/local/bin/intellij
fi