My developer setup on [Omarchy](https://omarchy.org/) (Arch + Hyprland + Wayland).

Installs go through Omarchy (`omarchy pkg add`, `omarchy install <browser|editor|dev-env|service|...>`); AUR via `yay` where no Omarchy equivalent exists.


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
./setup-zsh.sh
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
- [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono)

## CLI-Apps
- [lazygit](https://github.com/jesseduffield/lazygit)
- [fzf](https://github.com/junegunn/fzf)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [jq](https://github.com/stedolan/jq) + gron
- [bat](https://github.com/sharkdp/bat)
- [zoxide](https://github.com/ajeetdsouza/zoxide)
- [yazi](https://github.com/sxyazi/yazi)
- [direnv](https://github.com/direnv/direnv)
- psql client
- [wl-clipboard](https://github.com/ooghent/wl-clipboard) (`^Y` copies the typed line)
- [k9s](https://k9scli.io/) + [opencode](https://opencode.ai/docs/)

## Programming Languages
- all managed with mise

## Containerization
- [docker](https://www.docker.com/) + docker-compose

## GUI-Apps
- brave, keepassxc, dbeaver, libreoffice, intellij, vscode, spotify, discord
- synology-drive via AUR

## Dotfiles
Linked into `$HOME` with [lnko](https://github.com/luanvil/lnko):

| Package | Linked content |
| --- | --- |
| aliases | `.aliases` |
| bash | `.bashrc` |
| zsh | `.zshrc` |
| git | `.gitconfig`, `.gitconfig-personal`, `.githooks` |
| brave-origin | `.config/brave-origin-flags.conf` |
| hypr | `.config/hypr/*` |
| opencode | `.config/opencode/opencode.json` |
| scripts | `.local/bin/*.sh` |
| agents | `.agents/skills` |

The git config is skipped in git (`git update-index --skip-worktree`) so personal/work-dependent settings (like email) don't affect the repo.
To re-enable tracking: `git update-index --no-skip-worktree dotfiles/git/.config/git/config`
To disable tracking again: `git update-index --skip-worktree dotfiles/git/.config/git/config`

## Window Management
Not ported yet: the old wmctrl/skhd app-switching workflow is X11/macOS-only. Hyprland-native equivalents are tracked in `TODO.md`.

# Auto Setups
- packages (`install-all.sh`, one script per group; dev-envs combined in `install-dev-envs.sh`)
- dotfiles (lnko)
- ssh key generation hint: see `manual-settings/README.md`

# Manual Setups
See `/manual-settings/README.md`.


# Cool stuff
- jira branchn name generator with git hook
- vimiumC jira ticket opener
- phone blank space hyprland