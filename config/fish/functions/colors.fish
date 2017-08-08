# $Arch: colors.fish,v 1.007 2017/08/07 19:27:42 kyau Exp $

# Main Function {{{
function colors
	if count $argv >/dev/null
		while set -q argv[1]
			switch $argv[1]
				case -h --h --he --hel --help
					__kyau_colors_help
					return 0
				case '-f' '--format'
					if test (count $argv) -eq 2
						switch $argv[2]
							case inv inva invad invade invader invaders
								__kyau_colors_invaders
							case a al all
								__kyau_colors_all
						end
						#printf "format mode: %s\\n" "$argv[2]"
					end
					return 0
			end
			set -e argv[1]
		end
	else
		#__kyau_colors_help
		__kyau_colors_default
		return 0
	end
end
# }}}
# Help {{{
function __kyau_colors_help
	printf "help message\\n"
end
# }}}
# Colors: Default {{{
function __kyau_colors_default
	set -l colors (xrdb -query | sed -n 's/.*color\([0-9]\)/\1/p' | sort -nu | cut -f2)
	printf "\\n    "
	for i in (seq 0 7)
		set -l tmp (math $i + 1)
		printf "\\x1b[%sm█%s\\x1b[0m " (math 30 + $i) "$colors[$tmp]"
	end
	printf "\\n    "
	for i in (seq 8 15)
		set -l tmp (math $i + 1)
		printf "\\x1b[1;%sm█%s\\x1b[0m " (math 22 + $i) "$colors[$tmp]"
	end
	printf "\\n\\n"
end
# }}}
# Colors: Invaders {{{
function __kyau_colors_invaders
  set -l width 76
  set -l lef (math $COLUMNS - $width)
  set lef (math $lef / 2)
  if test (echo "$lef/2" | bc) != '0'
		set lef (math $lef - 1)
  end
  set -l left (printf "%*c" $lef " ")
	printf "\\n$left \\x1b[31m  ▀▄   ▄▀     \\x1b[32m ▄▄▄████▄▄▄    \\x1b[33m  ▄██▄     \\x1b[34m  ▀▄   ▄▀     \\x1b[35m ▄▄▄████▄▄▄    \\x1b[36m  ▄██▄  \\x1b[0m\\n$left \\x1b[31m ▄█▀███▀█▄    \\x1b[32m███▀▀██▀▀███   \\x1b[33m▄█▀██▀█▄   \\x1b[34m ▄█▀███▀█▄    \\x1b[35m███▀▀██▀▀███   \\x1b[36m▄█▀██▀█▄\\x1b[0m\\n$left \\x1b[31m█▀███████▀█   \\x1b[32m▀▀███▀▀███▀▀   \\x1b[33m▀█▀██▀█▀   \\x1b[34m█▀███████▀█   \\x1b[35m▀▀███▀▀███▀▀   \\x1b[36m▀█▀██▀█▀\\x1b[0m\\n$left \\x1b[31m▀ ▀▄▄ ▄▄▀ ▀   \\x1b[32m ▀█▄ ▀▀ ▄█▀    \\x1b[33m▀▄    ▄▀   \\x1b[34m▀ ▀▄▄ ▄▄▀ ▀   \\x1b[35m ▀█▄ ▀▀ ▄█▀    \\x1b[36m▀▄    ▄▀\\x1b[0m\\n\\n$left \\x1b[1;31m▄ ▀▄   ▄▀ ▄   \\x1b[32m ▄▄▄████▄▄▄    \\x1b[33m  ▄██▄     \\x1b[34m▄ ▀▄   ▄▀ ▄   \\x1b[35m ▄▄▄████▄▄▄    \\x1b[36m  ▄██▄  \\x1b[0m\\n$left \\x1b[1;31m█▄█▀███▀█▄█   \\x1b[32m███▀▀██▀▀███   \\x1b[33m▄█▀██▀█▄   \\x1b[34m█▄█▀███▀█▄█   \\x1b[35m███▀▀██▀▀███   \\x1b[36m▄█▀██▀█▄\\x1b[0m\\n$left \\x1b[1;31m▀█████████▀   \\x1b[32m▀▀▀██▀▀██▀▀▀   \\x1b[33m▀▀█▀▀█▀▀   \\x1b[34m▀█████████▀   \\x1b[35m▀▀▀██▀▀██▀▀▀   \\x1b[36m▀▀█▀▀█▀▀\\x1b[0m\\n$left \\x1b[1;31m ▄▀     ▀▄    \\x1b[32m▄▄▀▀ ▀▀ ▀▀▄▄   \\x1b[33m▄▀▄▀▀▄▀▄   \\x1b[34m ▄▀     ▀▄    \\x1b[35m▄▄▀▀ ▀▀ ▀▀▄▄   \\x1b[36m▄▀▄▀▀▄▀▄\\x1b[0m\\n\\n\\n$left                                     \\x1b[37m▌\\x1b[0m\\n\\n$left                                   \\x1b[37m▌\\x1b[0m\\n\\n$left                              \\x1b[37m    ▄█▄    \\x1b[0m\\n$left                              \\x1b[37m▄█████████▄\\x1b[0m\\n$left                              \\x1b[37m▀▀▀▀▀▀▀▀▀▀▀\\x1b[0m\\n"
end
# }}}
# Colors: ALL {{{
function __kyau_colors_all
  printf "  system\\n  "
	for co in (seq 0 7)
		printf "\\x1b[48;5;%sm  " "$co"
	end
	printf "\\x1b[0m\\n  "
	for co in (seq 8 15)
		printf "\\x1b[48;5;%sm  " "$co"
	end
  printf "\\x1b[0m\\n  cubes\\n  "
	for green in (seq 0 5)
		for red in (seq 0 5)
			for blue in (seq 0 5)
				set -l cocube (echo "16+($red*36)+($green*6)+$blue" | bc)
				printf "\\x1b[48;5;%sm  " "$cocube"
			end
			printf "\\x1b[0m  "
		end
		printf "\\n  "
	end
  printf "\\x1b[0m\\n  grayscale\\n  "
  for gco in (seq 232 255)
  	printf "\\x1b[48;5;%sm  " "$gco"
  end
  printf "\\x1b[0m\\n"
end
# }}}
