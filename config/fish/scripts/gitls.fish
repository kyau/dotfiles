# Defined in - @ line 0
function gitls --description 'alias gitls git ls-files -o --exclude-standard'
	git ls-files -o --exclude-standard $argv;
end
