#!/bin/bash

echo "starting dev setup: work"

sudo apt update -y
sudo apt upgrade -y

cd tasks
chmod +x git-work-setup.sh core-setup.sh node-setup.sh zsh-setup.sh dotfiles.sh productivity-tools.sh software.sh

./git-work-setup.sh
./core-setup.sh
./node-setup.sh
./zsh-setup.sh
./dotfiles.sh
./productivity-tools.sh
./software.sh
./browser.sh
./work-software.sh

echo "finished dev setup: work"