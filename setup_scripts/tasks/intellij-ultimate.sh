#!/bin/bash

# works but behaves a little weird
# if [ ! -d /opt/idea-IU-* ]; then
#     DOWNLOAD_LINK="https://download.jetbrains.com/idea/ideaIU-${INTELLIJ_VERSION}.tar.gz"

#     curl -fsSLo /tmp/intellij.tar.gz "${DOWNLOAD_LINK}"
#     sudo tar -xzf /tmp/intellij.tar.gz -C /opt

#     rm /tmp/intellij.tar.gz

#     sudo ln -s /opt/idea-IU-*/bin/idea.sh /usr/local/bin/intellij
# fi

sudo snap install intellij-idea-ultimate --classic
