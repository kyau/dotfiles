# $Arch: user.fish,v 1.011 2018/11/07 01:27:58 kyau Exp $

function user
  set -l colors
	#source $HOME/.config/fish/motd.fish
	if test -f /usr/bin/xhost
		if test (xhost)
			set colors (xrdb -query | sed -n 's/.*color\([0-9]\)/\1/p' | sort -nu | cut -f2)
		end
	else
		set -l count 1
		for x in (seq 50)[30..37 40..47]
			if test $x -gt 39
				set colors[$count] "1;$x"
			else
				set colors[$count] "0;$x"
			end
			set count (math $count + 1)
		end
	end
	set -l edit (echo "$EDITOR" | sed -r 's/.*\/(.*)/\1/')
	set -l shel (echo "$SHELL" | sed -r 's/.*\/(.*)/\1/')
	set -l page (echo "$PAGER" | sed -r 's/.*\/(.*)/\1/')
	set -l ter (echo "$TERM" | sed -r 's/(.*)-.*/\1/')
	set -l grp (groups | sed -r 's/ /,/g')
	printf "\\n  \\x1b[38;5;244muser\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m   \\x1b[38;5;244mgroups\\x1b[0m\\x1b[38;5;240m/%s\\n" "$USER" "$grp"
	printf "  \\x1b[38;5;244meditor\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m  \\x1b[38;5;244mpager\\x1b[0m\\x1b[38;5;240m/%s  \\x1b[38;5;244mshell\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m  \\x1b[38;5;244mterm\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m\\n" "$edit" "$page" "$shel" "$ter"
	
	printf "\\n  "
	for i in (seq 0 7)
		set -l tmp (math $i + 1)
		printf "\\x1b[%sm█%s\\x1b[0m " (math 30 + $i) "$colors[$tmp]"
	end
	printf "\\n  "
	for i in (seq 8 15)
		set -l tmp (math $i + 1)
		printf "\\x1b[1;%sm█%s\\x1b[0m " (math 22 + $i) "$colors[$tmp]"
	end
	printf "\\n\\n"
end

# vim: ts=2 sw=2 noet :
