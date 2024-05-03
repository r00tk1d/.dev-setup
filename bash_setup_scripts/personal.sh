#!/bin/bash

echo "starting dev setup: work"

# sudo apt update -y
# sudo apt upgrade -y

cd tasks
chmod +x git-personal-setup.sh core-setup.sh node-setup.sh zsh-setup.sh dotfiles.sh productivity-tools.sh software.sh

./git-personal-setup.sh
# ./core-setup.sh
# ./node-setup.sh
# ./zsh-setup.sh
# ./dotfiles.sh
# ./productivity-tools.sh
# ./software.sh
# ./browser.sh
# ./personal-software.sh

echo "finished dev setup: work"