# $Arch: tunnel.fish,v 1.002 2017/08/07 19:47:11 kyau Exp $

function tunnel
	if count $argv >/dev/null
		while set -q argv[1]
			switch $argv[1]
				case -h --h --he --hel --help
					__kyau_tunnel_help
					return 0
				case -t --t --tu --tun --tunn --tunne --tunnel
					if test (count $argv) -eq 2
						sshuttle --dns -vr $argv[2] 0/0
					end
					return 0
			end
			set -e argv[1]
		end
	else
		__kyau_tunnel_help
		return 0
	end
end

function __kyau_tunnel_help
	printf "Usage: tunnel [OPTION]...\\n"
	printf "Create a transparent VPN from an ssh tunnel. Does nothing with no OPTION.\\n"
	printf "  -t|--tunnel\\thostname to create tunnel to\\n"
	printf "  -h\\t\\tdisplay this help and exit\\n\\n"
end
