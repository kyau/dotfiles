# $Arch: config.fish,v 1.010 2017/08/07 19:25:03 kyau Exp $

# General {{{
# always fix delete
tput smkx
# proper umask
umask 077
# default greeting
set fish_greeting
# }}}
# Interactive Shell {{{
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
	# setup - for previous directory
	abbr -a -- - 'cd -'
  # display the motd
	source $HOME/.config/fish/motd.fish
	echo
end
# }}}
# Login Shell {{{
if status --is-login
	# Xorg login if applicable
	set sysd (systemctl list-units --type target | string match -r 'graphical\.target    loaded active active' | sed -r 's/    / /' | string split " ")
	if [ $sysd[3] = "active" ]
		if begin; test -z "$DISPLAY"; and test -n "$XDG_VTNR"; and test "$XDG_VTNR" = "1"; end
			startx
		end
	end
end
# }}}

# vim: ts=2 sw=2 noet :
