#!/bin/bash
set -x

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)" # TODO is this necessary?

# log all output to log.out
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec > >(tee log.out) 2>&1

# track failed package installations
FAILED_PACKAGES=""
handle_fail() {
    FAILED_PACKAGES="$FAILED_PACKAGES $1"
    echo "Installation of $1 failed"
}


##########################
# ???
##########################
sudo apt update && sudo apt upgrade -y
sudo apt-get -q install -y xdg-utils || handle_fail "xdg-utils"
sudo apt-get -q install -y unzip || handle_fail "unzip"
sudo apt-get -q install -y snapd || handle_fail "snapd"
sudo apt-get -q install -y curl || handle_fail "curl"
sudo apt-get -q install -y git || handle_fail "git"

##########################
# git setup
##########################
# git directories
mkdir ~/work
mkdir ~/personal
# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm -rf lazygit.tar.gz lazygit

##########################
# ssh setup
##########################
cd $HOME
# generate ssh key if not existing
if ! [[ -f ".ssh/id_ed25519" ]]; then
  mkdir -p .ssh 
  ssh-keygen -t ed25519 -f ".ssh/id_ed25519" -N "" -C "$USER@$HOSTNAME"
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi
cd $CURRENT_DIR # TODO is this necessary?

##########################
# programming languages
##########################
# python3
sudo apt-get -q install -y python3 || handle_fail "python3"
sudo apt-get -q install -y python3-pip || handle_fail "python3-pip"
# java
curl -s "https://get.sdkman.io" | bash || handle_fail "sdkman"
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sudo apt install maven -y
# nodejs
(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash) || handle_fail "nvm"
# rust
curl https://sh.rustup.rs -sSf | sh || handle_fail "rust"
source $HOME/.cargo/env

##########################
# terminal setup
##########################
sudo apt-get -q install -y starship || handle_fail "starship"

sudo apt-get -q install -y zsh || handle_fail "zsh"
# Change shell to Zsh
chsh -s $(which zsh)
# Install Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
# Install zsh-autosuggestions plugin
if [ ! -d "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
fi
# Install zsh-syntax-highlighting plugin
if [ ! -d "$HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
fi
# Install fzf-tab plugin
if [ ! -d "$HOME/.oh-my-zsh/plugins/fzf-tab" ]; then
    git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/plugins/fzf-tab
fi

# TODO Nerdfonts

##########################
# terminal tools
##########################
sudo add-apt-repository ppa:maveonair/helix-editor
sudo apt update
sudo apt install helix
sudo apt-get -q install -y gnome-tweak-tool || handle_fail "gnome-tweak-tool" # UI tool to customize GNOME desktop
sudo apt-get -q install -y fzf || handle_fail "fzf" # Fuzzy finder for the command line
sudo apt-get -q install -y xclip || handle_fail "xclip" # clipboard command line utility
sudo apt-get -q install -y ripgrep || handle_fail "ripgrep" # Fast recursive search tool (like grep but better)
sudo apt-get -q install -y jq || handle_fail "jq" # Lightweight and flexible JSON processor
sudo apt-get -q install -y gron || handle_fail "gron" # Transforms JSON into grep-friendly format
sudo apt-get -q install -y bat || handle_fail "bat" # Cat clone with syntax highlighting and Git integration
sudo apt-get -q install -y z || handle_fail "zoxide" # Smarter cd command (quick directory jumping)
sudo apt-get -q install -y wmctrl || handle_fail "wmctrl" # Command-line tool to interact with X window manager
sudo apt-get -q install -y xdotool || handle_fail "xdotool" # Simulate keyboard/mouse input and window management
bash <(curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install) || handle_fail "navi"  # Command-line cheat sheet manager
sudo apt-get -q install -y postgresql-client || handle_fail "postgresql-client" # Client for postgres DBs
sudo snap install yazi --classic # terminal file manager TODO snap install puts the dotfiles in another location! Change to other installation method
cargo install --locked zellij
sudo apt-get -q install -y direnv || handle_fail "direnv" # Environment variable manager

##########################
# container setup
##########################
curl -fsSL https://get.docker.com | sudo bash || handle_fail "docker"

##########################
# software
##########################
sudo apt-get -q install -y libreoffice libreoffice-l10n-de libreoffice-help-de || handle_fail "libreoffice"
sudo apt-get -q install -y keepassxc || handle_fail "keepassxc"
sudo apt-get -q install -y gedit || handle_fail "gedit"
sudo snap install spotify || handle_fail "spotify"
sudo snap install --classic code || handle_fail "vscode"
sudo snap install brave || handle_fail "brave-browser"
sudo snap install dbeaver-ce || handle_fail "dbeaver"
sudo snap install intellij-idea --classic || handle_fail "intellij-idea"




if [ -n "$FAILED_PACKAGES" ]; then
    echo "Summary: Failed to install the following packages: '$FAILED_PACKAGES'"
else
    echo "Summary: All packages installed successfully"
fi


echo "Automatic setup script completed."