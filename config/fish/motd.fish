# $Arch: motd.fish,v 1.023 2017/08/28 11:51:12 kyau Exp $

# ANSI
set ANSI $HOME/dot/ansi/(hostname -s).ans

# Padding/Remove Color {{{
function get_padding
	set -l space ""
	for i in (seq 1 $argv[1])
		set space " "$space
	end
	printf $space
end
function remove_color
	printf $argv | perl -pe 's/\x1b.*?[mGKH]//g'
end
# }}}
# Warning {{{
function warning
  set -l cols (tput cols)
	set -l left "  . here be dragons"
	if test $FISH_PLATFORM = "Linux"
		set -l lastlogin (last -2 -R $USER | head -2 | cut -c 20- | sed -n 2p | sed -r 's/(.*) -.*/\1/')
	else
		set -l lastlogin (last -2 kyau | head -2 | cut -c 45- | sed -n 2p | sed -r "s/(.*) -.*/\1/")
	end
  set -l tty (tty | sed -r 's/\/dev\/(.*)/\1/' | sed -r 's/\///')
  set -l right ".tty/$tty"
  set -l padding (get_padding (math $cols - (echo "$left$right" | string length)))
	printf " \x1b[38;5;124m \u2026 here be dragons\x1b[0m$padding\x1b[38;5;242m\$tty\x1b[0m\x1b[38;5;240m/$tty\n"
end
# }}}
# Distribution & Kernel Version {{{
function getdistro
	set -l rtext
	set -l text (grep "PRETTY_NAME" /etc/*release | sed -r 's/.*:PRETTY_NAME="(.*)"/\1/' | head -1)
	set -l ver (uname -r | sed -r 's/(.*)-(.*)-.*/\1-\2/')
	set -l kernel "\x1b[38;5;252m$ver\x1b[0m"
	switch $text
		case 'Arch*'
			printf " \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;32m \\uf300 \\x1b[38;5;252march\\x1b[38;5;32mlinux\\x1b[0m $kernel                                 \\x1b[38;5;237m░░░·\\x1b[0m\\n"

		case 'OpenBSD*'
			printf " \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;199m \\ue225 \\x1b[38;5;226mopenbsd\\x1b[0m $kernel                                        \\x1b[38;5;237m░░░·\\x1b[0m\\n"
		case '*'
			printf "$text $kernel"
	end
end
# }}}
# Hostname & IPs {{{
function network
	if test $FISH_PLATFORM = "Linux"
		set -l nic (/bin/ls /sys/class/net | head -1)
		set -l iplist (ip -4 addr show $nic | grep -oP "(?<=inet ).*(?=/)" | sed -e :a -e '$!N; s/\n/, /; ta')
		set -l fullhost (hostname -f)
		printf " \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m   \x1b[38;5;242m$fullhost\x1b[0m \x1b[38;5;240m($iplist)\n"
	else
		set -l iplist (cat /etc/systemip)
		set -l fullhost (hostname)
		printf " \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m   \x1b[38;5;242m$fullhost\x1b[0m \x1b[38;5;240m%-33s \\x1b[38;5;237m░\\x1b[38;5;242m:\\x1b[0m\\n" "($iplist)"
	end
end
# }}}

warning
cat $ANSI
printf " \\x1b[38;5;255m┌\\x1b[38;5;242m────\\x1b[38;5;235m─·\\x1b[38;5;242m─\x1b[38;5;235m─·─────────────────────────────────────────────────┐\\n"
getdistro
network
printf " \\x1b[38;5;235m·\\x1b[38;5;237m░\\x1b[38;5;233m── \\x1b[38;5;235m· \\x1b[38;5;242m· \\x1b[1;37m· \\x1b[38;5;242m· \\x1b[38;5;235m·\\x1b[0m \\x1b[38;5;233m───────────────────────────────────────────\\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
if test $HOSTNAME = "raptr.kyaulabs.com"
	printf " \\x1b[38;5;235m│\\x1b[38;5;237m░░░ \\x1b[38;5;242mcommands\\x1b[38;5;240m: help, sysinfo, rules, vhosts               \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
end
printf " \\x1b[38;5;235m└─────────────────────────────────────────────·─\\x1b[38;5;242m─\\x1b[1;39m·─\\x1b[38;5;242m─\\x1b[1;39m─\\x1b[38;5;242m──────\\x1b[38;5;255m┘\\x1b[0m\\n"

# vim: ts=2 sw=2 noet :
