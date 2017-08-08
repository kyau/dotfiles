# $Arch: ls.fish,v 1.001 2017/08/07 19:44:03 kyau Exp $

function ls
	command ls --color=auto --file-type --group-directories-first $argv;
end
