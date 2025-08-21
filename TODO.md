
- use .env file instead of user-input.sh
- use personal and work git accounts 
- rearrange install scripts

- brave browser plugins and user settings dotfile
    https://www.chromium.org/administrators/pre-installed-extensions/
    - Bookmarks dotfile .config/BraveSoftware/Brave-Browser/Default/Bookmarks cleanup

- convert shortcuts.ods in tsv or csv

- make scripts idempotent

- script for clean up/remove everything that is installed with this repo
- (credential handling)

- cleanup intellij (settings) and export to this repo

- ranger or similar?

- teardown script

- clipboard manager:
    Extension: Clipboard Manager not working:
    git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git ~/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com
    gnome-extensions enable clipboard-indicator@tudmotu.com

- decide for more verbose/quiet output

- add README.md in manual_settings folder

- docker image for testing

- vimium c instead of vimium?

- switch-window.sh: currently might not focusing the last used window from app A if switching from App B to App A. It focuses the last opened window. This might be non trivial to adjust but would be an improvement

Things to test:
https://github.com/ibraheemdev/modern-unix
- Application Launcher: Ulaunch, Albert
- rofi, dmenu
- Text expander: Expanso
- entr 
- zellij
- homerow mods (knomad, qmk) https://precondition.github.io/home-row-mods
- remap caps lock: to esc? delete? ctrl?
- vimium vomnibar custom: https://jdhao.github.io/2023/04/18/vimium_custom_search_engine/ 
- i3, polybar
- keepassxc chrome extension
- adjust shortcuts to have the same meaning in different applications. e.g. Alt+left/right, F2, strg z strg y, etc.
- powerlevel10k
- zsh-completions
- lazydocker
- lazygit
- k9s
- ripgrep-all !!!
- https://github.com/tldr-pages/tldr?tab=readme-ov-file#similar-projects navi or cheat for saving commands for cli
- shortcut management

idea: launch everything from commandline and use something like dmenu to quickly use aliases for launching/switching etc.
