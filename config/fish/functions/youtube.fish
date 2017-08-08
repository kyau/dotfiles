# $Arch: youtube.fish,v 1.001 2017/08/07 19:47:49 kyau Exp $

function youtube
	if test -z $argv
		printf "Usage: youtube <url>\\n"
		return 0
	end
	mpv --ytdl $argv
end
