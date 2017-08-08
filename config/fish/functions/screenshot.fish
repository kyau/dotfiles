# $Arch: screenshot.fish,v 1.001 2017/08/07 19:46:17 kyau Exp $

function screenshot
	set -l format '%Y-%m-%d_%H%M%S_$wx$h.png'
	set -l location "$HOME/.screenshots/"
	set -l cmd (printf "scrot -c -d 10 -m %s -e 'mv -f %s'" "$format" "$location")
	eval $cmd
end
