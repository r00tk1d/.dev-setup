# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"

# copy the current typed line to clipboard with ^Y
copy_line_to_clipboard() {
    printf '%s' "$BUFFER" | wl-copy
    zle reset-prompt
}
zle -N copy_line_to_clipboard
bindkey '^Y' copy_line_to_clipboard

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

zstyle ':omz:update' mode auto      # update automatically without asking

HIST_STAMPS="dd.mm.yyyy"

plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting mvn fzf-tab)

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"
# zoxide init zsh --cmd cd
source $HOME/.aliases

# Open zellij on startup
# eval "$(zellij setup --generate-auto-start zsh)"
# Ctrl + G for opening navi

# Ctrl + G for opening navi
eval "$(navi widget zsh)"

eval "$(starship init zsh)"

eval "$(direnv hook zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.npm-global/bin:$PATH"
# opencode
export PATH="$HOME/.opencode/bin:$PATH"
