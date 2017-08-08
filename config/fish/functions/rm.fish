# $Arch: rm.fish,v 1.001 2017/08/07 19:46:08 kyau Exp $

function rm
	command rm -I --preserve-root $argv;
end
