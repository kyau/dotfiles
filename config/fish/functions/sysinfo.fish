# $Arch: sysinfo.fish,v 1.010 2017/08/07 19:27:26 kyau Exp $

function sysinfo
	clear
	source $HOME/.config/fish/motd.fish
	set -l colors (xrdb -query | sed -n 's/.*color\([0-9]\)/\1/p' | sort -nu | cut -f2)
	set -l edit (echo "$EDITOR" | sed -r 's/.*\/(.*)/\1/')
	set -l shel (echo "$SHELL" | sed -r 's/.*\/(.*)/\1/')
	set -l page (echo "$PAGER" | sed -r 's/.*\/(.*)/\1/')
	set -l ter (echo "$TERM" | sed -r 's/(.*)-.*/\1/')
	set -l grp (groups | sed -r 's/ /,/g')
	set -l cpu (cat /proc/cpuinfo | grep "model name" | head -1 | string replace -r 'model name\s+:' '')
	set -l cpu (echo $cpu | string replace -r "\(R\)" '' | string replace -r "\(TM\)" '' | string replace -r ' CPU' '' | string trim -l)
	set -l pci (lspci | grep ' VGA ' | cut -d" " -f 1)
	set -l gpu (lspci -v -s $pci | head -1 | string replace -r ".*:" '' | string replace -r " Corporation" '' | string replace -r "\(.*" '' | string trim -l)
	set -l ram (awk '/^MemTotal:/{print $2}' /proc/meminfo)
	set -l ram (math $ram / 1024)
	set -l swap (awk '/^SwapTotal:/{print $2}' /proc/meminfo)
	set -l swap (math $swap / 1024)
	printf "\\n    \\x1b[38;5;244muser\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m   \\x1b[38;5;244mgroups\\x1b[0m\\x1b[38;5;240m/%s\\n" "$USER" "$grp"
	printf "    \\x1b[38;5;244meditor\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m  \\x1b[38;5;244mpager\\x1b[0m\\x1b[38;5;240m/%s  \\x1b[38;5;244mshell\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m  \\x1b[38;5;244mterm\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m\\n\\n" "$edit" "$page" "$shel" "$ter"
	printf "    \\x1b[38;5;244mcpu\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m\\n" "$cpu"
	printf "    \\x1b[38;5;244mgpu\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m\\n" "$gpu"
	printf "    \\x1b[38;5;244mram\\x1b[0m\\x1b[38;5;240m/%sMB\\x1b[0m  \\x1b[38;5;244mswap\\x1b[0m\\x1b[38;5;240m/%sMB\\x1b[0m\\n" "$ram" "$swap"
	
	printf "\\n    "
	for i in (seq 0 7)
		set -l tmp (math $i + 1)
		printf "\\x1b[%sm█%s\\x1b[0m " (math 30 + $i) "$colors[$tmp]"
	end
	printf "\\n    "
	for i in (seq 8 15)
		set -l tmp (math $i + 1)
		printf "\\x1b[1;%sm█%s\\x1b[0m " (math 22 + $i) "$colors[$tmp]"
	end
	printf "\\n\\n"
end
