# $Arch: chmod.fish,v 1.001 2017/08/07 19:29:41 kyau Exp $

function chmod --description 'alias chmod chmod --preserve-root'
	command chmod --preserve-root $argv;
end
