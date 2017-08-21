# $Arch: rules.fish,v 1.001 2017/08/21 01:02:44 kyau Exp $

function rules
	# ANSI
	set ANSI $HOME/dot/ansi/rules.ans
	printf "\\n"
	cat $ANSI
	printf "  \\x1b[38;5;255m┌\\x1b[38;5;242m────\\x1b[38;5;235m─·\\x1b[38;5;242m─\x1b[38;5;235m─·─────────────────────────────────────────────────────────────────┐\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0;34m   \\x1b[38;5;124mNO\\x1b[38;5;244m Porn/Warez or other illicit and/or illegal material is allowed!   \\x1b[0m\\x1b[38;5;237m░·\\x1b[0m\\n"
		printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;235m  \\x1b[38;5;124mNO\\x1b[38;5;244m DDoS/Hacking/Probing/Scanning or using the shell to conduct such!  \\x1b[38;5;237m░\\x1b[38;5;242m:\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m          \\x1b[38;5;244mShells may be terminated at any time, without reason          \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;235m────────────────────────────────────────────────────────────────────────\\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m           \\x1b[0;36mBG Process\\x1b[38;5;240m:\\x1b[38;5;246m1     \\x1b[0;36mFG Process\\x1b[38;5;240m:\\x1b[38;5;246m2     \\x1b[0;36mDisk Quota\\x1b[38;5;240m:\\x1b[38;5;246m256MB           \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[38;5;233m               \\x1b[0;36mCustom IPv6\\x1b[38;5;240m:\\x1b[38;5;246m2     \\x1b[0;36mWWW\\x1b[38;5;240m:\\x1b[38;5;246mNo     \\x1b[0;36mBandwidth\\x1b[38;5;240m:\\x1b[38;5;246m1GB               \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;235m────────────────────────────────────────────────────────────────────────\\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;244m  Please respect your ability to be here, and do not abuse the machine  \x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;244m  and ruin things for others. If we all play nice this will stay here,  \x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;235m·\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;244m       possibly indefinitely. That said, backups are done nightly.      \x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;235m│\\x1b[38;5;237m░                              \\x1b[38;5;235m· \\x1b[38;5;242m· \\x1b[1;37m· \\x1b[38;5;242m· \\x1b[38;5;235m·\\x1b[0m                                 \\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
	printf "  \\x1b[38;5;235m└─────────────────────────────────────────────────────────────·─\\x1b[38;5;242m─\\x1b[1;39m·─\\x1b[38;5;242m─\\x1b[1;39m─\\x1b[38;5;242m──────\\x1b[38;5;255m┘\\x1b[0m\\n"
end

# vim: ts=2 sw=2 noet :
