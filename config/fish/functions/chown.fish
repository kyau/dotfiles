# $Arch: chown.fish,v 1.001 2017/08/07 19:29:50 kyau Exp $

function chown
	command chown --preserve-root $argv;
end
