function youtube
	if test -z $argv
		printf "Usage: youtube <url>\\n"
		return 0
	end
	mpv --ytdl $argv
end
