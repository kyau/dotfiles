# Defined in - @ line 0
function ls --description 'alias ls ls --color=auto --file-type --group-directories-first'
	command ls --color=auto --file-type --group-directories-first $argv;
end
