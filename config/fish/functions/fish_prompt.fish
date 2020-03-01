# $KYAULabs: fish_prompt.fish,v 1.2.9 2020/02/29 22:43:48 kyau Exp $

function fish_prompt
	set -l status_copy $status
	set -l pwd_info (pwd_info "/")
	set -l dir
	set -l base
	set -l color (set_color white)
	set -l color2 (set_color normal)
	set -l color_error (printf "\\x1b[38;5;124m")
	set -l color_normal (set_color $fish_color_normal)
	if test "$status_copy" -ne 0
		set color "$color_error"
		set color2 "$color_error"
	end

	if test ! -z "$SSH_CLIENT"
		if test 0 -eq (id -u "$USER")
			echo -sn "$color_error\$ $color_normal"
		end
		set -l _fish_hostname (cat /proc/sys/kernel/hostname | cut -d '.' -f 1)
		if test 0 -eq (id -u "$USER")
			printf "%s%s%s " "$color_error" "$_fish_hostname" "$color_normal"
		else
			printf "\\x1b[38;5;242m%s%s " "$_fish_hostname" "$color_normal"
		end
	else
		if test 0 -eq (id -u "$USER")
			echo -sn "$color_error\$ $color_normal"
		else
			echo -sn " "
		end
	end
	if test "$PWD" = ~
		set base (printf "\\x1b[38;5;14m")"~"
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
		set -l git_glyph (printf " \\uf141 ")
		if git_is_staged
			set git_color (set_color green)
			if git_is_dirty
				set git_glyph "$git_color $git_glyph $color_error$git_glyph"
			end
		else if git_is_dirty
			set git_color "$color_error"
		else if git_is_touched
			set git_color "$color_error"
		else
			set git_color (printf "\\x1b[38;5;14m")
		end
		set -l git_ahead (git_ahead "*" "-" "*-")
		set -l left_par "("
		set -l right_par ")"
		if git_is_stashed
			set left_par "{"
			set right_par "}"
		end
		set -l color_branch (printf "\\x1b[38;5;199m")
		set branch_name "$git_color$left_par$branch_name$git_color$right_par"
		echo -sn "$git_color$git_glyph$branch_name$git_ahead$color_normal "
	else
		echo -sn "$color_normal "
	end
end
