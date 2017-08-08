# $Arch: grep.fish,v 1.001 2017/08/07 19:33:55 kyau Exp $

function grep
	command grep --color=auto --exclude-dir=\.git --exclude-dir=\.svn --exclude-dir=\.hg $argv;
end
