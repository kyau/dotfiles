# always fix delete
tput smkx

# is this an interactive shell?
if status --is-interactive
	# Enable core dumping
	ulimit -c unlimited
	# System variables
	set -gx PATH $HOME/bin $PATH
	set -gx CLICOLOR 1
	set -gx LC_COLLATE C
	# User variables
	set -gx EDITOR vim
	set -gx EMAIL kyau@kyau.net
	set -gx HOSTNAME (hostname)
	set -gx IRCNAME https://kyau.net/
	set -gx IRCNICK kyau
	set -gx VISUAL $EDITOR
	set -gx PAGER less

	abbr -a -- - 'cd -'

	source $HOME/.config/fish/motd.fish
end

# default greeting
set fish_greeting

# is this a login shell?
if status --is-login
	# Xorg login if applicable
	set sysd (systemctl list-units --type target | string match -r 'graphical\.target    loaded active active' | sed -r 's/    / /' | string split " ")
	if [ $sysd[3] = "active" ]
		echo "LOGIN"
		if begin; test -z "$DISPLAY"; and test -n "$XDG_VTNR"; and test "$XDG_VTNR" = "1"; end
			startx
		end
	end
end

# vim: ts=2 sw=2 noet :
