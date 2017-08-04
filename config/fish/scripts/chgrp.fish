# Defined in - @ line 0
function chgrp --description 'alias chgrp chgrp --preserve-root'
	command chgrp --preserve-root $argv;
end
