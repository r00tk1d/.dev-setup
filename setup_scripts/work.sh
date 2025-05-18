#!/bin/bash
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec > >(tee log.out) 2>&1

FAILED_PACKAGES=""

handle_fail() {
    FAILED_PACKAGES="$FAILED_PACKAGES $1"
    echo "Installation of $1 failed"
}

source work_values.sh || exit 1

cd tasks

chmod +x core-setup.sh && source core-setup.sh
chmod +x git-work-setup.sh && source git-work-setup.sh
chmod +x ssh.sh && source ssh.sh
chmod +x node-setup.sh && source node-setup.sh
chmod +x zsh-setup.sh && source zsh-setup.sh
chmod +x jira.sh && source jira.sh
chmod +x java.sh && source java.sh
chmod +x rust.sh && source rust.sh
chmod +x docker.sh && source docker.sh || handle_fail "docker"
chmod +x productivity-tools.sh && source productivity-tools.sh
chmod +x zellij.sh && source zellij.sh
chmod +x software.sh && source software.sh
chmod +x intellij-ultimate.sh && source intellij-ultimate.sh
chmod +x stow-dotfiles.sh && source stow-dotfiles.sh
chmod +x load-gnome-settings.sh && source load-gnome-settings.sh || handle_fail "load-gnome-settings"



if [ -n "$FAILED_PACKAGES" ]; then
    echo "Summary: Failed to install the following packages:$FAILED_PACKAGES"
else
    echo "Summary: All packages installed successfully"
fi


echo "Logging out to apply settings..."
sleep 3
gnome-session-quit