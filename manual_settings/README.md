1. Set git ssh key
2. Github:
    1. Set SSH Key
    2. Change git remote to use ssh (to be able to update this repo in the future)
        `git remote set-url origin git@github.com:r00tk1d/.dev-setup.git`
3. Browser:
    1. Import Bookmarks
    2. Install Extensions:
        - Install [Vimium](https://chromewebstore.google.com/detail/vimium/dbepggeogbaibhgnhhndojpepiihcmeb)
        - Install [powertabs](https://github.com/r00tk1d/power-tabs)
        - Install [jira-branch-name-generator-extension](https://github.com/r00tk1d/jira-branch-name-generator-extension)
4. Import Vimium Settings
5. Import Intellij Settings 
6. Set X11 as the default display server (necessary for window switch shortcuts):
    1. `sudo nano /etc/gdm/custom.conf`
    2. Set: `WaylandEnable=false`
    3. `sudo reboot`
7. Install [gnome vitals](https://github.com/corecoding/Vitals):
    1. run `extension-manager`
    2. search for vitals and install
    3. sometimes reboot is necessary to get all vitals
    4. adjust vitals in topbar as needed
8. change ticket prefix in dotfiles/git/.githooks/prepare-commit-msg
9. for work: create a `.gitconfig-work` file in HOME directory with settings for work