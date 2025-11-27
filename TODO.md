- docker image for testing
- use .env file instead of user-input.sh?
- rearrange install scripts

- make location of repository irrelevant

- https://gist.github.com/mohanpedala/1e2ff5661761d3abd0385e8223e16425?permalink_comment_id=3799230 

- brave browser plugins and user settings dotfile
    https://www.chromium.org/administrators/pre-installed-extensions/

- convert shortcuts.ods in tsv or csv

- make scripts idempotent

- script for clean up/remove everything that is installed with this repo
- (credential handling)

- cleanup intellij (settings) and export to this repo

- clipboard manager:
    Extension: Clipboard Manager not working:
    git clone https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator.git ~/.local/share/gnome-shell/extensions/clipboard-indicator@tudmotu.com
    gnome-extensions enable clipboard-indicator@tudmotu.com

- decide for more verbose/quiet output

- vimium c instead of vimium?

- switch-window.sh: currently might not focusing the last used window from app A if switching from App B to App A. It focuses the last opened window. This might be non trivial to adjust but would be an improvement

- use glab mr to create merge requests from command line and create a Teams message for review?

Things to test:
https://github.com/ibraheemdev/modern-unix
- Application Launcher: Ulaunch, Albert
- rofi, dmenu
- Text expander: Expanso
- entr 
- homerow mods (knomad, qmk) https://precondition.github.io/home-row-mods
- remap caps lock: to esc? delete? ctrl?
- vimium vomnibar custom: https://jdhao.github.io/2023/04/18/vimium_custom_search_engine/ 
- i3, polybar
- keepassxc chrome extension or switch to pass?
- adjust shortcuts to have the same meaning in different applications. e.g. Alt+left/right, F2, strg z strg y, etc.
- powerlevel10k
- zsh-completions
- lazydocker
- k9s
- ripgrep-all
- shortcut management
- get riod of ohmyzsh, use zinit?

idea: launch everything from commandline and use something like dmenu to quickly use aliases for launching/switching etc.
