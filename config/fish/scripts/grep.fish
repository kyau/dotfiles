# Defined in - @ line 0
function grep --description alias\ grep\ grep\ --color=auto\ --exclude-dir=\\.git\ --exclude-dir=\\.svn\ --exclude-dir=\\.hg
	command grep --color=auto --exclude-dir=\.git --exclude-dir=\.svn --exclude-dir=\.hg $argv;
end
