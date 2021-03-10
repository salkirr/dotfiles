if status is-interactive
    set -x XDG_CURRENT_DESKTOP sway

    set -x SSH_AUTH_SOCK $XDG_RUNTIME_DIR/keyring/ssh

    set -x EDITOR nvim
    set -x VISUAL nvim

    set -x GOPATH $HOME/go

    set -x PATH $GOPATH/bin $PATH
    set -x PATH $HOME/.local/bin $PATH
    set -x PATH $HOME/.cargo/bin $PATH
    set -x PATH $HOME/.local/share/nvim/mason/bin $PATH
end

if type -q theme.sh
	if test -e ~/.theme_history
	theme.sh (theme.sh -l|tail -n1)
	end

	# Optional
	# Bind C-o to the last theme.
	function last_theme
		theme.sh (theme.sh -l|tail -n2|head -n1)
	end

	bind \co last_theme

	alias th='theme.sh -i'

	# Interactively load a light theme
	alias thl='theme.sh --light -i'

	# Interactively load a dark theme
	alias thd='theme.sh --dark -i'
end
