My developer setup on [Omarchy](https://omarchy.org/) (Arch + Hyprland + Wayland).

Uses packages from official Arch repo if possible and AUR for some other packages.


# Quickstart

1. Clone Repo into home directory:
```bash
git clone https://github.com/r00tk1d/.-devsetup.git $HOME/.dev-setup
```
2. Run installer (requires `yay`):
```bash
cd $HOME/.dev-setup && ./install-all.sh
```
Or run the `install-*.sh` scripts individually.
3. Set Zsh as login shell:
```bash
./set-shell.sh
```
4. Apply Manual Settings in `/manual-settings`

# Goal
- Minimal setup for maximum joy.
- Use sane defaults wherever possible.
- Fast Navigation with keyboard (using shortcuts or fuzzy finding).
- No useless animations.

## Keyboard
I think US QWERTY keyboard using the ANSI physical layout are the best for programming and efficient typing. However, additionally I need to write german special characters every now and then. The EurKEY Layout fits these needs perfectly: (https://eurkey.steffen.bruentjen.eu/?lang=de).

Set it in Hyprland (`kb_layout = eu`) and use the [kenkyo](https://github.com/argenkiwi/kenkyo) home-row mods layout via [kanata](https://github.com/jtroo/kanana): see `manual-settings/`.

# What?

## Terminal
- [zsh](https://www.zsh.org/) with [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
    - [fzf-tab](https://github.com/Aloxaf/fzf-tab)
    - bundled plugins: git, fzf, mvn
- [starship](https://github.com/starship/starship)
- [zellij](https://zellij.dev/)
- [helix](https://helix-editor.com/)
- [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)

## CLI-Apps
- [lazygit](https://github.com/jesseduffield/lazygit)
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [jq](https://github.com/stedolan/jq) + gron
- [bat](https://github.com/sharkdp/bat)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [navi](https://github.com/denisidoro/navi) (cheatsheets in `dotfiles/navi`)
- [yazi](https://github.com/sxyazi/yazi)
- [direnv](https://github.com/direnv/direnv)
- psql client
- [wl-clipboard](https://github.com/ooghent/wl-clipboard) (`^Y` copies the typed line)

## Programming Languages
- all managed with mise

## Containerization
- [docker](https://www.docker.com/) + docker-compose

## GUI-Apps
- brave, keepassxc, dbeaver, libreoffice, intellij, vscode, spotify

## Dotfiles
Linked into `$HOME` with [lnko](https://github.com/luanvil/lnko):

| Package | Linked content |
| --- | --- |
| aliases | `.aliases` |
| bash | `.bashrc` |
| zsh | `.zshrc` |
| git | `.gitconfig`, `.gitconfig-personal`, `.githooks` |
| brave-origin | `.config/brave-origin-flags.conf` |
| starship | `.config/starship.toml` |
| zellij | `.config/zellij/config.kdl` |
| helix | `.config/helix/config.toml` |
| opencode | `.config/opencode/opencode.json` |
| navi | `.local/share/navi/cheats` |
| scripts | `.local/bin/*.sh` |
| agents | `.agents/skills` |

Git commit hooks live in `~/.githooks` (see `core.hooksPath` in `.gitconfig`).

## Window Management
Not ported yet: the old wmctrl/skhd app-switching workflow is X11/macOS-only. Hyprland-native equivalents are tracked in `TODO.md`.

# Auto Setups
- packages (install-all.sh)
- dotfiles (lnko)
- ssh key generation hint: see `manual-settings/README.md`

# Manual Setups
See `/manual-settings/README.md`.
