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

## setup tools
- bash script


## Keyboard
- EurKEY Layout for german special chars äöüß (https://eurkey.steffen.bruentjen.eu/?lang=de)

## Git
- 

## IntelliJ

## Gnome

## Ubuntu Navigation