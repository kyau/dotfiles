# $Arch: nssh.fish,v 1.001 2017/08/07 19:45:13 kyau Exp $

function nssh
	ssh -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no $argv;
end
