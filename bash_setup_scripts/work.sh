#!/bin/bash

echo "starting dev setup: work"

sudo apt update -y
sudo apt upgrade -y

cd tasks
chmod +x git-work-setup.sh core-setup.sh node-setup.sh zsh-setup.sh dotfiles.sh productivity-tools.sh software.sh

./tasks/git-work-setup.sh
./tasks/core-setup.sh
./tasks/node-setup.sh
./tasks/zsh-setup.sh
./tasks/dotfiles.sh
./tasks/productivity-tools.sh
./tasks/software.sh
#./tasks/browser.sh
#./tasks/work-software.sh

echo "finished dev setup: work"