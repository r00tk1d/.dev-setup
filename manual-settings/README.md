# Manual Settings (Omarchy / Arch / Hyprland)

1. SSH key:
    1. Generate if missing: `ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N "" -C "$USER@$HOSTNAME"`
    2. Add to GitHub
2. Github:
    1. Set SSH Key
    2. Change git remote to use ssh (to be able to update this repo in the future)
        `git remote set-url origin git@github.com:r00tk1d/omarchy-dev-setup.git`
3. Git hooks:
    1. Make sure the hook is executable: `chmod +x ~/.githooks/prepare-commit-msg`
    2. Change ticket prefix in `~/.githooks/prepare-commit-msg`
4. Work git config: create a `~/.gitconfig-work` file with your work settings (overrides personal config everywhere except `~/personal/*`, see `dotfiles/git/.gitconfig`)
5. Browser:
    1. Import Bookmarks
    2. Install Extensions:
        - Install [Vimium](https://chromewebstore.google.com/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)
            - set custom search engine for quick jira ticket access. e.g.: `j: https://mycompany/jira/browse/ABC-%s jira`
        - Install [jira-branch-name-generator-extension](https://github.com/r00tk1d/jira-branch-name-generator-extension)
6. Intellij: import `intellij_settings.zip` from this folder
7. Keyboard layout:
    1. Set EurKEY in Hyprland input config (`kb_layout = eu`)
    2. Install [kanata](https://github.com/jtroo/kanata) for the [kenkyo](https://github.com/argenkiwi/kenkyo) home-row mods layout
        1. `yay -S kanata`
        2. Give kanata access to `/dev/uinput` (uinput group + udev rule, see kanata wiki)
        3. Autostart via Hyprland: `exec-once = kanata -c <path-to>/default.conf`
