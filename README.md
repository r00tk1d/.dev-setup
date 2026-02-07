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

However, I might switch to a dotfile manager in the future for easier maintanability (like automatically creating folders, backup old dotfiles that are currently just overwritten and automatic updates of symlinks).


# What?

## OS Settings
- hide Appbar
- Appbar left

## Window Management

### Switch between apps and windows quickly
MOD = Super (Ubuntu) / Control + Option (Mac)

Switch to certain app window by shortcut: Mod + LETTER
```
App not open -> Open and Focus App

App open but not focused -> Focus App

App open and focused -> Cycle to next window of the App
```

Open new instance of app by shortcut: Mod + Shift + LETTER


### Move windows quickly
MOD = Super (Ubuntu) / Control + Option (Mac)

```
MOD + l -> Move focused window to right half of the screen
MOD + h -> Move focused window to left half of the screen
MOD + k -> Maximize focused window

MOD + Shift + l-> Move focused window to next monitor right
MOD + Shift + h -> Move focused window to next monitor left
```
### Achieve this window management
- ubuntu (x11):
    - wmctrl (manage windows)
    - xdotool (simulate keyboard/mouse input)
    - gnome (map shortcuts to scripts, window management)
- mac:
    - skhd (global hotkeys)
    - rectangle (window management)

## Browser
- Brave
    - [vimium](https://github.com/philc/vimium)
    - [jira branch name generator](https://github.com/r00tk1d/jira-branch-name-generator)



## Keyboard
- [EurKEY Layout](https://eurkey.steffen.bruentjen.eu/)
- Remap CapsLock to Hyperkey

## Terminal
- Mac:
    - [iTerm2](https://iterm2.com/)
    - [starship](https://github.com/starship/starship)
    - [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)
    - TokyoNight

## Zsh Plugins
I use [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh) as zsh framework.
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [fzf-tab](https://github.com/Aloxaf/fzf-tab)
- [git](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git)
- [dirhistory](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/dirhistory)
- [fzf](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf)
- [mvn](https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/mvn)

## Containerization
- [docker](https://www.docker.com/)

## CLI-Apps
- [lazygit](https://github.com/jesseduffield/lazygit)
- [helix](https://helix-editor.com/)
- [fzf](https://github.com/junegunn/fzf)
- xclip (linux only)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [jq](https://github.com/stedolan/jq)
- [bat](https://github.com/sharkdp/bat)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [navi](https://github.com/denisidoro/navi)
- postgresql-client
- [yazi](https://github.com/sxyazi/yazi)
- [direnv](https://github.com/direnv/direnv)

## GUI-Apps
- spotify
- libreoffice
- keepassxc
- vscode
- intellij
- brave
- dbeaver

## Auto Setups
- git
- dotfiles
- ssh

## Manual Setups