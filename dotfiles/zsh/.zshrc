# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load zsh options, keybindings, and completion
[[ -f /usr/share/omarchy-zsh/shell/zoptions ]] && source /usr/share/omarchy-zsh/shell/zoptions

# Load shared shell configuration (aliases, functions, environment, tool init)
[[ -f /usr/share/omarchy-zsh/shell/all ]] && source /usr/share/omarchy-zsh/shell/all

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh

# Undo omarchy's precmd hook that rebinds Tab back to its own router on every
# prompt; fzf-tab needs Tab bound to fzf-tab-complete to work.
add-zsh-hook -d precmd _omarchy-bind-tab-completion
bindkey '^I' fzf-tab-complete


# copy the current typed line to clipboard with ^Y
copy_line_to_clipboard() {
    printf '%s' "$BUFFER" | wl-copy
    zle reset-prompt
}
zle -N copy_line_to_clipboard
bindkey '^Y' copy_line_to_clipboard

# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# cheatsheet picker (^G): inserts a command from ~/.config/cheatsheet/commands
_cheatsheet_widget() {
	local file="${XDG_CONFIG_HOME:-$HOME/.config}/cheatsheet/commands"
	[[ -f $file ]] || { zle -M "cheatsheet: $file not found"; zle reset-prompt; return 1; }
	local selected
	selected=$(awk '
		/^#/ { desc = $0; next }
		desc != "" && /[^[:space:]]/ { printf "%s\n%s\0", desc, $0; desc = "" }
		/^[[:space:]]*$/ { desc = "" }
	' "$file" | fzf --read0 --prompt='cheatsheet> ' --height=40% --reverse)
	[[ -n $selected ]] || { zle reset-prompt; return 0; }
	LBUFFER=${selected#*$'\n'}
	zle reset-prompt
}
zle -N _cheatsheet_widget
bindkey '^G' _cheatsheet_widget


# plugins=(git) TODO set git aliases that I use
source $HOME/.aliases

# direnv
eval "$(direnv hook zsh)"
