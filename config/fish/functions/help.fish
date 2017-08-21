# $Arch: help.fish,v 1.000 2017/08/21 01:12:45 kyau Exp $

function help
	# ANSI
	set ANSI $HOME/dot/ansi/help.ans
	printf "\\n"
	cat $ANSI
	printf "  \\x1b[38;5;255m┌\\x1b[38;5;242m────\\x1b[38;5;235m─·\\x1b[38;5;242m─\x1b[38;5;235m─·─────────────────────────────────────────────────────────────────┐\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0;34m  \\x1b[38;5;42mGetting Started                                                       \\x1b[0m\\x1b[38;5;237m░·\\x1b[0m\\n"
		printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;235m  \\x1b[38;5;244mThere are a variety of programs at your disposal pre-installed and    \\x1b[38;5;237m░\\x1b[38;5;242m:\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m  \\x1b[38;5;244mready to use. See the list below the specifics. The default shell is  \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m  \\x1b[38;5;244mfish, check out https://fishshell.com/ for more information.          \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;235m────────────────────────────────────────────────────────────────────────\\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m  \\x1b[38;5;42mAvailable Programs                                                    \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m  \\x1b[38;5;23mcompilers: \\x1b[38;5;238megcc, python2, tcl                                         \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m  \\x1b[38;5;23meditors: \\x1b[38;5;238mee, nano, vim                                                \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m  \\x1b[38;5;23mirc: \\x1b[38;5;238meggdrop, irssi, znc                                              \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m  \\x1b[38;5;23msource: \\x1b[38;5;238mgit                                                           \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m  \\x1b[38;5;23mterm: \\x1b[38;5;238mtmux                                                            \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m  \\x1b[38;5;23mwww: \\x1b[38;5;238mcurl, links, wget                                                \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;235m────────────────────────────────────────────────────────────────────────\\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m  \\x1b[38;5;42mWeb Hosting                                                           \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;235m·\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;244m  Coming Soon!                                                          \x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;235m│\\x1b[38;5;237m░                              \\x1b[38;5;235m· \\x1b[38;5;242m· \\x1b[1;37m· \\x1b[38;5;242m· \\x1b[38;5;235m·\\x1b[0m                                 \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;235m└─────────────────────────────────────────────────────────────·─\\x1b[38;5;242m─\\x1b[1;39m·─\\x1b[38;5;242m─\\x1b[1;39m─\\x1b[38;5;242m──────\\x1b[38;5;255m┘\\x1b[0m\\n"
end

# vim: ts=2 sw=2 noet :
