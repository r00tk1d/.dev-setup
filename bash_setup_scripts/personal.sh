#!/bin/bash


echo "starting dev setup: work"

FAILED_PACKAGES=""

handle_fail() {
    FAILED_PACKAGES="$FAILED_PACKAGES $1"
    echo "Installation of $1 failed"
}



cd tasks
chmod +x git-personal-setup.sh core-setup.sh node-setup.sh zsh-setup.sh dotfiles.sh productivity-tools.sh software.sh

./core-setup.sh
./git-personal-setup.sh
./node-setup.sh
./zsh-setup.sh
# ./dotfiles.sh
# ./productivity-tools.sh
# ./software.sh
# ./browser.sh
# ./personal-software.sh


if [ -n "$FAILED_PACKAGES" ]; then
    echo "Summary: Failed to install the following packages:$FAILED_PACKAGES"
else
    echo "Summary: All packages installed successfully"
fi

echo "finished dev setup: work"