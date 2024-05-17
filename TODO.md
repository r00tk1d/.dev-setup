Vor finalem install:
- einmal durchlaufen lassen
- gnome-settings.sh einbinden und testen. gnome-settings.ini exportieren nach durchlauf des scripts und mit dem hier im repo abgleichen\
- maus scroll geschwindigkeit anpassen
- einmal durchlaufen lassen und alle commands testen







- migrate new_ticket.sh, worktime.sh 

- brave browser plugins dotfile
    https://www.chromium.org/administrators/pre-installed-extensions/
    - Bookmarks dotfile .config/BraveSoftware/Brave-Browser/Default/Bookmarks cleanup

- convert shortcuts.ods in tsv or csv

- make scripts idempotent

- script for clean up/remove everything that is installed with this repo

- ubuntu settings (for example task bar apps)
	- ~/.config/dconf/user  <-add to dotfiles after a clean ubuntu setup with gedit and favorite bar is set manuallu correct. then stow
- (credential handling)

- cleanup intellij (settings) and export to this repo

- rename to .dev_setup?

- decide for more verbose/quiet output

- add README.md in manual_settings folder

Things to test:
- Application Launcher: Ulaunch, Albert
- Text expander: Expanso
- entr 
- xdotool 
- eza
- zoxide
- zellij
- homerow mods (knomad, qmk) https://precondition.github.io/home-row-mods
- remap caps lock: to esc? delete? ctrl?
- vimium vomnibar custom: https://jdhao.github.io/2023/04/18/vimium_custom_search_engine/ 
- i3, polybar
- keepassxc chrome extension
- adjust shortcuts to have the same meaning in different applications. e.g. Alt+left/right, F2, strg z strg y, etc.
- add more shortcuts for all used programs (e.g. brave browser, spotify, etc.)
- powerlevel10k
- zsh-syntax-highlighting, zsh-completions
