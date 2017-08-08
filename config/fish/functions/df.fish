# $Arch: df.fish,v 1.001 2017/08/07 19:30:51 kyau Exp $

function df
	command df -Th --total $argv;
end
