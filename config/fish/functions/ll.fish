# $Arch: ll.fish,v 1.001 2017/08/07 19:35:01 kyau Exp $

function ll
	ls -l --human-readable $argv;
end
