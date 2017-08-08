# $Arch: gitad.fish,v 1.001 2017/08/07 19:32:21 kyau Exp $

function gitad
	git add -A -n . $argv;
end
