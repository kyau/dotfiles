function screenshot
	set -l format '%Y-%m-%d_%H%M%S_$wx$h.png'
	set -l location "$HOME/.screenshots/"
	set -l cmd (printf "scrot -c -d 10 -m %s -e 'mv -f %s'" "$format" "$location")
	eval $cmd
end
