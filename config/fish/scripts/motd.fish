#! /usr/bin/fish

set ANSI $HOME/bin/(hostname -s).ans

function warning
	printf " \x1b[38;5;124m\u2026here be dragons\x1b[0m\n"
end

function getdistro
	set -l text (grep "PRETTY_NAME" /etc/*release | sed -r 's/.*:PRETTY_NAME="(.*)"/\1/')
	switch $text
		case 'Arch*'
			printf " \x1b[38;5;32m \uf300 \x1b[38;5;252march\x1b[38;5;32mlinux\e[0m"
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
	printf "    \e[38;5;244m$fullhost\e[0m \e[38;5;240m($iplist)\n"
end

function environ
	set -l edit (echo "$EDITOR" | sed -r 's/.*\/(.*)/\1/')
	set -l shel (echo "$SHELL" | sed -r 's/.*\/(.*)/\1/')
	set -l page (echo "$PAGER" | sed -r 's/.*\/(.*)/\1/')
	printf "    \e[38;5;244m\$editor\e[0m\e[38;5;240m/$edit\e[0m  \e[38;5;244m\$pager\e[0m\e[38;5;240m/$page  \e[38;5;244m\$shell\e[0m\e[38;5;240m/$shel\e[0m\n"
end


warning
cat $ANSI
echo -e
getdistro
network
environ
echo -e

# vim: ts=2 sw=2 noet :
