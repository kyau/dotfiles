# $Arch: diff.fish,v 1.001 2017/08/07 19:31:01 kyau Exp $

function diff
	colordiff -u $argv;
end
