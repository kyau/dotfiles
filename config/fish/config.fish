tput smkx
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

# extra user functions
for file in $HOME/.config/fish/scripts/*.fish
	source $file
end

# Xorg login if applicable
function __fish_on_interactive
	set SYSTEMD_TARGET (systemctl list-units --type target | grep graphical | sed 's/		 / /' | cut -d " " -f3)
	if [ "active" = "$SYSTEMD_TARGET" ]
		if begin; test -z "$DISPLAY"; and test -n "$XDG_VTNR"; and test "$XDG_VTNR" = "1"; end
			echo "Start Xorg"
		else
			eval $HOME/bin/motd
		end
	end
end

# vim: ts=2 sw=2 noet :
