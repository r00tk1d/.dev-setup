#!/bin/bash
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec > >(tee log.out) 2>&1


FAILED_PACKAGES=""

handle_fail() {
    FAILED_PACKAGES="$FAILED_PACKAGES $1"
    echo "Installation of $1 failed"
}

source values.sh || exit 1

cd tasks
chmod +x git-personal-setup.sh ssh.sh core-setup.sh node-setup.sh zsh-setup.sh stow-dotfiles.sh java.sh productivity-tools.sh software.sh intellij-community.sh brave-browser.sh personal-software.sh

# source core-setup.sh
# source stow-dotfiles.sh
# source git-personal-setup.sh
source ssh.sh
# source node-setup.sh
# source zsh-setup.sh
source java.sh
# source productivity-tools.sh
# source software.sh
# source personal-software.sh
source intellij-community.sh || handle_fail "intellij-community"
# source brave-browser.sh || handle_fail "brave-browser"
# source spotify.sh || handle_fail "spotify"


if [ -n "$FAILED_PACKAGES" ]; then
    echo "Summary: Failed to install the following packages:$FAILED_PACKAGES"
else
    echo "Summary: All packages installed successfully"
fi