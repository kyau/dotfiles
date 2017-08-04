# Defined in - @ line 0
function nssh --description 'alias nssh ssh -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no'
	ssh -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no $argv;
end
