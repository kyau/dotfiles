# $Arch: chgrp.fish,v 1.001 2017/08/07 19:29:31 kyau Exp $

function chgrp
	command chgrp --preserve-root $argv;
end
