My mostly automated Debian/GNOME setup using bash scripts and dotfiles.

# Quickstart

## 1. Clone Repo into home directory:
```bash
sudo apt-get update -y && sudo apt-get install -y curl git software-properties-common && cd ~ && git clone https://github.com/r00tk1d/.dev-setup.git $HOME/.dev-setup
```

## 2. Run Setup Script:
(The last run is logged in `~/.dev-setup/setup-script/log.out`.)
Run:
```bash
cd ~/.dev-setup/setup-script && chmod +x setup.sh && ./setup.sh
```

## 3. Apply Manual Settings
All setting files are inside the directory `~/.dev-setup/manual_settings/`.

# Why?

## Philosophy
- minimal amount of needed tools for maximum joy
- master less tools is better than using more tools but dont understand them fully
- navigation to a point i want to be quickly should when ever possible happen with keyboard shortcuts. If thats not possible through fuzzy finding.

## setup tools
- bash scripts
- disadvantage: idempotency


## Keyboard
- I find US QWERTY keyboard using the ANSI physical layout are the best for programming and efficient typing imo. However additionally I need to write german special characters every now and when. The EurKEY Layout fits these needs perfectly: (https://eurkey.steffen.bruentjen.eu/?lang=de)

## Git
- 

## IntelliJ

## Gnome

## Ubuntu Navigation

## Managing dotfiles (why no dotfile manager like stow)
- The dotfiles in this repo are the single source truth and should always overwrite local files. With stow its not easily possible to achieve this behavior. Furthermore it hides what actually happens. With symlinks its one less dependency and straight forward to understand. A little bit more manual work if I want to add a new dotfile, but this also keeps me in the loop how many dotfiles i actually have and reminds me of reducing them to get a minimal setup.

## Zsh

## Shortcuts

## Aliases

## Cheatsheets