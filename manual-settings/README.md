# Manual Settings (Omarchy / Arch / Hyprland)

1. SSH key:
    1. Generate if missing: `ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N "" -C "$USER@$HOSTNAME"`
    2. Add to GitHub
4. Work git config: create a `~/.gitconfig-work` file with your work settings (overrides personal config everywhere except `~/personal/*`, see `dotfiles/git/.gitconfig`)
5. Browser:
    - set custom search engine for quick jira ticket access. e.g.: `j: https://mycompany/jira/browse/ABC-%s jira`
6. Intellij: import `intellij_settings.zip` from this folder
7. Keyboard layout:
    1. Set EurKEY in Hyprland input config (`kb_layout = eu`)
    2. Install [kanata](https://github.com/jtroo/kanata) for the [kenkyo](https://github.com/argenkiwi/kenkyo) home-row mods layout
        1. `yay -S kanata`
        2. Give kanata access to `/dev/uinput` (uinput group + udev rule, see kanata wiki)
        3. Autostart via Hyprland: `exec-once = kanata -c <path-to>/default.conf`
8. connect keepass-xc plugin with DB