# $Arch: gitls.fish,v 1.001 2017/08/07 19:33:45 kyau Exp $

function gitls
	git ls-files -o --exclude-standard $argv;
end
