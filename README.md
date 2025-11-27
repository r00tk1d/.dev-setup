My developer setup (currently Debian based).

# Quickstart

1. Clone Repo into home directory:
```bash
git clone https://github.com/r00tk1d/.dev-setup.git $HOME/.dev-setup
```
2. Run scripts in `/setup-scripts`
3. Link `/dotfiles`
4. Apply Manual Settings in `/manual-settings`


# Goal
- Minimal setup for maximum joy.
- Use sane defaults wherever possible.
- Fast Navigation with keyboard (using shortcuts or fuzzy finding).
- Animations are a no-no.

## Keyboard
I think US QWERTY keyboard using the ANSI physical layout are the best for programming and efficient typing. However, additionally I need to write german special characters every now and then. The EurKEY Layout fits these needs perfectly: (https://eurkey.steffen.bruentjen.eu/?lang=de)

## Managing dotfiles (why no dotfile manager like stow)
The dotfiles in this repo are the single source truth and should always overwrite local files. With stow its not easily possible to achieve this behavior. Furthermore it hides what actually happens. With symlinks its one less dependency and straight forward to understand. A little bit more manual work if I want to add a new dotfile, but this also keeps me in the loop how many dotfiles i actually have and reminds me of reducing them to get a minimal setup.


# What?

## OS Settings
- hide Appbar
- Appbar left

## Window Management
- ubuntu:
    - gnome-tweak-tool
    - wmctrl
    - xdotool
- mac:
    - skhd (or rcmd?)
    - rectangle
    - (rcmd?)
    - (yabai?)
    - (hyperkey? CapsLock -> hyperkey)

## Shortcuts

## Keyboard
- EurKEY
- Remap CapsLock to Esc

## Terminal
- Mac:
    - iTerm2
    - Starship
    - JetBrains Mono Nerd Font
    - TokyoNight

## Shell ohmyzsh (Zsh Plugins)
- zsh-autosuggestions
- zsh-syntax-highlighting
- fzf-tab
- git
- dirhistory 
- fzf
- mvn

## Containerization
- docker

## CLI-Apps
- lazygit
- helix
- fzf
- xclip (linux only)
- ripgrep
- jq
- bat
- z
- navi
- postgresql-client
- yazi

## GUI-Apps
- spotify
- terminal
- libreoffice
- keepassxc
- vscode
- brave
    - vimium
    - jira branch name generator

## Auto Setups
- git
- dotfiles
- ssh -> create ssh (remove from )

## 

## Manual Setup

## Aliases

## Cheatsheets