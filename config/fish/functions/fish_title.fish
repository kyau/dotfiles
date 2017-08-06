function fish_title
	set -l cpwd (pwd | string replace "/home/$USER" "~")
	if test $_ = 'fish'
		echo $_ $cpwd
	else
		echo $argv
	end
end
