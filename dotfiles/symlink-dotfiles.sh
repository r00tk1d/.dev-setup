#!/bin/bash

# CAREFUL! This overwrites existing files!
echo "WARNING: this will overwrite existing dotfiles."
read -p "Continue? (y/N): " ans

if [[ "$ans" != "y" ]]; then
    echo "Aborted."
    exit 1
fi

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"   # absolute path to dotfiles

# $HOME
ln -sf "$DOTFILES_DIR/aliases/.aliases" "$HOME/.aliases" 
ln -sf "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES_DIR/git/.git-commit-message-template.txt" "$HOME/.git-commit-message-template.txt"
ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES_DIR/git/.gitconfig-personal" "$HOME/.gitconfig-personal"

# githooks
mkdir ~/.githooks
ln -sf "$DOTFILES_DIR/git/.githooks/prepare-commit-msg" "$HOME/.githooks/prepare-commit-msg"

# .config
ln -sf "$DOTFILES_DIR/config/.config/autostart/gedit.desktop" "$HOME/.config/autostart/gedit.desktop"
ln -sf "$DOTFILES_DIR/config/.config/zellij/config.kdl" "$HOME/.config/zellij/config.kdl"
ln -sf "$DOTFILES_DIR/config/.config/helix/config.toml" "$HOME/.config/helix/helix.toml"
ln -sf "$DOTFILES_DIR/config/.config/starship.toml" "$HOME/.config/starship.toml"

# .local
ln -sf "$DOTFILES_DIR/scripts/.local/bin/canvas.html" "$HOME/.local/bin/canvas.html"
ln -sf "$DOTFILES_DIR/scripts/.local/bin/canvas.sh" "$HOME/.local/bin/canvas.sh"
ln -sf "$DOTFILES_DIR/scripts/.local/bin/dev-morning.sh" "$HOME/.local/bin/dev-morning.sh"
ln -sf "$DOTFILES_DIR/scripts/.local/bin/git-bisect-find-bug.sh" "$HOME/.local/bin/git-bisect-find-bug.sh"
ln -sf "$DOTFILES_DIR/scripts/.local/bin/switch-window.sh" "$HOME/.local/bin/switch-window.sh"
ln -sf "$DOTFILES_DIR/scripts/.local/bin/timer.sh" "$HOME/.local/bin/timer.sh"
ln -sf "$DOTFILES_DIR/scripts/.local/bin/uptimes.sh" "$HOME/.local/bin/uptimes.sh"
ln -sf "$DOTFILES_DIR/scripts/.local/bin/code-review.sh" "$HOME/.local/bin/code-review.sh"
ln -sf "$DOTFILES_DIR/cheatsheets/.local/share/navi/cheats/docker.cheat" "$HOME/.local/share/navi/cheats/docker.cheat"
ln -sf "$DOTFILES_DIR/cheatsheets/.local/share/navi/cheats/ripgrep.cheat" "$HOME/.local/share/navi/cheats/ripgrep.cheat"
ln -sf "$DOTFILES_DIR/cheatsheets/.local/share/navi/cheats/git.cheat" "$HOME/.local/share/navi/cheats/git.cheat"
ln -sf "$DOTFILES_DIR/cheatsheets/.local/share/navi/cheats/psql.cheat" "$HOME/.local/share/navi/cheats/psql.cheat"
ln -sf "$DOTFILES_DIR/cheatsheets/.local/share/navi/cheats/kubectl.cheat" "$HOME/.local/share/navi/cheats/kubectl.cheat"
ln -sf "$DOTFILES_DIR/cheatsheets/.local/share/navi/cheats/maven.cheat" "$HOME/.local/share/navi/cheats/maven.cheat"
ln -sf "$DOTFILES_DIR/cheatsheets/.local/share/navi/cheats/rainfrog.cheat" "$HOME/.local/share/navi/cheats/rainfrog.cheat"