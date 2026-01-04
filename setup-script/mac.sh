#!/bin/bash
set -x

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)" 

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
# Core Utilities
##########################
if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
brew update && brew upgrade
brew install unzip || handle_fail "unzip"
brew install curl || handle_fail "curl"

##########################
# git setup
##########################
mkdir -p ~/work
mkdir -p ~/personal
brew install git || handle_fail "git"
brew install lazygit || handle_fail "lazygit"

##########################
# ssh setup
##########################
cd $HOME
if ! [[ -f ".ssh/id_ed25519" ]]; then
  mkdir -p .ssh 
  ssh-keygen -t ed25519 -f ".ssh/id_ed25519" -N "" -C "$USER@$(hostname)"
  eval "$(ssh-agent -s)"
  ssh-add --apple-use-keychain ~/.ssh/id_ed25519
fi
cd "$CURRENT_DIR"

##########################
# programming languages
##########################
# python3
brew install python3 || handle_fail "python3"
# java
curl -s "https://get.sdkman.io" | bash || handle_fail "sdkman"
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
brew install maven || handle_fail "maven"
# nodejs
(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash) || handle_fail "nvm"

##########################
# terminal setup
##########################
brew install starship || handle_fail "starship"
brew install zsh || handle_fail "zsh"

# Install Oh-My-Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
# Plugins
[ ! -d "$HOME/.oh-my-zsh/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions
[ ! -d "$HOME/.oh-my-zsh/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
[ ! -d "$HOME/.oh-my-zsh/plugins/fzf-tab" ] && git clone https://github.com/Aloxaf/fzf-tab ~/.oh-my-zsh/plugins/fzf-tab

# Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-symbols-only-nerd-font || handle_fail "nerdfonts"

##########################
# cli tools
##########################
brew install helix || handle_fail "helix"
# gnome-tweak-tool is Linux only. No direct Mac equivalent.
brew install fzf || handle_fail "fzf"
# xclip is Linux only. macOS uses 'pbcopy' and 'pbpaste' (built-in).
brew install ripgrep || handle_fail "ripgrep"
brew install jq || handle_fail "jq"
brew install gron || handle_fail "gron"
brew install bat || handle_fail "bat"
brew install zoxide || handle_fail "zoxide"
# wmctrl/xdotool are for X11/Linux. Raycast or Yabai are Mac alternatives.
brew install navi || handle_fail "navi"
brew install libpq || handle_fail "postgresql-client" # Mac client
brew install yazi || handle_fail "yazi"
brew install zellij || handle_fail "zellij"
brew install direnv || handle_fail "direnv"

##########################
# container setup
##########################
# On Mac, Docker is usually installed as a Desktop App
brew install --cask docker || handle_fail "docker"

##########################
# software (Casks)
##########################
brew install --cask libreoffice || handle_fail "libreoffice"
brew install --cask keepassxc || handle_fail "keepassxc"
brew install --cask sublime-text || handle_fail "sublime" # gedit replacement
brew install --cask spotify || handle_fail "spotify"
brew install --cask visual-studio-code || handle_fail "vscode"
brew install --cask brave-browser || handle_fail "brave"
brew install --cask dbeaver-community || handle_fail "dbeaver"
brew install --cask intellij-idea || handle_fail "intellij-idea"

##########################
# window management setup
##########################
brew install asmvik/formulae/skhd
skhd --start-service

if [ -n "$FAILED_PACKAGES" ]; then
    echo "Summary: Failed to install the following packages: '$FAILED_PACKAGES'"
else
    echo "Summary: All packages installed successfully"
fi

echo "Automatic setup script completed."