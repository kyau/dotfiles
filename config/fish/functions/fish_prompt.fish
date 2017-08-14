# $Arch: fish_prompt.fish,v 1.025 2017/08/14 00:40:29 kyau Exp $

function fish_prompt
	set -l status_copy $status
	set -l pwd_info (pwd_info "/")
	set -l dir
	set -l base
	set -l color (set_color white)
	set -l color2 (set_color normal)
	set -l color_error (set_color $fish_color_error)
	set -l color_normal (set_color $fish_color_normal)
	if test "$status_copy" -ne 0
		set color "$color_error"
		set color2 "$color_error"
	end

	if test ! -z "$SSH_CLIENT"
		set -l color ""
		if test 0 -eq (id -u "$USER")
			printf "%s%s%s" "$color_error" (hostname -s) "$color_normal"
		else
			printf "\\x1b[38;5;238m%s%s" (hostname -s) "$color_normal"
		end

		if test 0 -eq (id -u "$USER")
			echo -sn "$color_error\$ $color_normal"
		else
			echo -sn " "
		end
	else
		if test 0 -eq (id -u "$USER")
			echo -sn "$color_error\$ $color_normal"
		else
			echo -sn " "
		end
	end
	if test "$PWD" = ~
		set base (set_color cyan)"~"
	else if pwd_is_home
		set dir
	else
		if test "$PWD" != /
			set dir "/"
		end
		set base "$color_error/"
	end
	if test ! -z "$pwd_info[1]"
		set base "$pwd_info[1]"
	end
	if test ! -z "$pwd_info[2]"
		set dir "$dir$pwd_info[2]/"
	end
	echo -sn "$color2$dir$color$base$color_normal"
	if test ! -z "$pwd_info[3]"
		echo -sn "$color/$pwd_info[3]"
	end
	if set branch_name (git_branch_name)
		set -l git_color
		set -l git_glyph "╍"
		if git_is_staged
			set git_color (set_color green)
			if git_is_dirty
				set git_glyph "$git_color$git_glyph$color_error$git_glyph"
				set git_color "$color_error"
			end
		else if git_is_dirty
			set git_color "$color_error"
		else if git_is_touched
			set git_color "$color_error"
		else
			set git_color (set_color cyan)
		end
		set -l git_ahead (git_ahead "+" "-" "+-")
		if test "$branch_name" = "master"
			set branch_name
			if git_is_stashed
				set branch_name "{}"
			end
		else
			set -l left_par "("
			set -l right_par ")"
			if git_is_stashed
				set left_par "{"
				set right_par "}"
			end
			set branch_name " $git_color$left_par$color2$branch_name$git_color$right_par"
		end
		echo -sn " $git_color$git_glyph$branch_name$git_ahead"
	end
	echo -sn "$color_normal "
end
