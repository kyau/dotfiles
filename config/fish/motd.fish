#! /usr/bin/fish

set ANSI $HOME/bin/(hostname -s).ans

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

function warning
  set -l cols (tput cols)
	set -l left "  . here be dragons"
	set -l lastlogin (last -2 -R  $USER | head -2 | cut -c 20- | sed -n 2p | sed -r 's/(.*) -.*/\1/')
  set -l tty (tty | sed -r 's/\/dev\/(.*)/\1/' | sed -r 's/\///')
  set -l right ".tty/$tty"
  set -l padding (get_padding (math $cols - (echo "$left$right" | string length)))
	printf " \x1b[38;5;124m \u2026 here be dragons\x1b[0m$padding\x1b[38;5;244m\$tty\x1b[0m\x1b[38;5;240m/$tty\n"
end

function getdistro
	set -l text (grep "PRETTY_NAME" /etc/*release | sed -r 's/.*:PRETTY_NAME="(.*)"/\1/')
	switch $text
		case 'Arch*'
			printf " \x1b[38;5;32m \uf300 \x1b[38;5;252march\x1b[38;5;32mlinux\x1b[0m"
		case '*'
			printf " $text"
	end
	set -l ver (uname -r | sed -r 's/(.*)-(.*)-.*/\1-\2/')
	set -l kernel "\x1b[38;5;252m$ver\x1b[0m"
	printf " $kernel\n"
end

function network
	set -l nic (/bin/ls /sys/class/net | head -1)
	set -l iplist (ip -4 addr show $nic | grep -oP "(?<=inet ).*(?=/)" | sed -e :a -e '$!N; s/\n/, /; ta')
	set -l fullhost (hostname -f)
	printf "    \x1b[38;5;244m$fullhost\x1b[0m \x1b[38;5;240m($iplist)\n"
end

function environ
	set -l edit (echo "$EDITOR" | sed -r 's/.*\/(.*)/\1/')
	set -l shel (echo "$SHELL" | sed -r 's/.*\/(.*)/\1/')
	set -l page (echo "$PAGER" | sed -r 's/.*\/(.*)/\1/')
	set -l ter (echo "$TERM" | sed -r 's/(.*)-.*/\1/')
	set -l grp (groups | sed -r 's/ /,/g')
	printf "    \x1b[38;5;244m\$user\x1b[0m\x1b[38;5;240m/$USER\x1b[0m   \x1b[38;5;244m\$groups\x1b[0m\x1b[38;5;240m/$grp\n"
	printf "    \x1b[38;5;244m\$editor\x1b[0m\x1b[38;5;240m/$edit\x1b[0m  \x1b[38;5;244m\$pager\x1b[0m\x1b[38;5;240m/$page  \x1b[38;5;244m\$shell\x1b[0m\x1b[38;5;240m/$shel\x1b[0m  \x1b[38;5;244m\$term\x1b[0m\x1b[38;5;240m/$ter\x1b[0m\n"
end


warning
cat $ANSI
echo -e
getdistro
network
#environ
echo -e

# vim: ts=2 sw=2 noet :