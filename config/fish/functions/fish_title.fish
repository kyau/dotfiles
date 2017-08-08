# $Arch: fish_title.fish,v 1.001 2017/08/07 19:31:57 kyau Exp $

function fish_title
	set -l cpwd (pwd | string replace "/home/$USER" "~")
	if test $_ = 'fish'
		echo $_ $cpwd
	else
		echo $argv
	end
end
