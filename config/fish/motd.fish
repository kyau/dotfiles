# $Arch: motd.fish,v 1.034 2019/02/11 22:46:19 kyau Exp $

# ANSI
set -g ANSI $HOME/dot/ansi/(hostname -s).ans
set -g _SSL_DOMAINS "kyau.net" "kyaulabs.com" "voidbbs.com" "ah42.org"
set -g _SERVICES "nftables" "sshd" "nginx" "mariadb"

# Padding/Remove Color {{{
function get_padding
	set -l space ""
	for i in (seq 1 $argv[1])
		set space " "$space
	end
	printf $space
end
function remove_color
	printf $argv | perl -pe 's/\x1b.*?[mGKH]//g'
end
# }}}
# Warning {{{
function _motd_warning
  set -l cols (tput cols)
	set -l left "  . here be dragons"
	if test $FISH_PLATFORM = "Linux"
		set -l lastlogin (last -2 -R $USER | head -2 | cut -c 20- | sed -n 2p | sed -r 's/(.*) -.*/\1/')
	else
		set -l lastlogin (last -2 kyau | head -2 | cut -c 45- | sed -n 2p | sed -r "s/(.*) -.*/\1/")
	end
  set -l tty (tty | sed -r 's/\/dev\/(.*)/\1/' | sed -r 's/\///')
  set -l right ".tty/$tty"
  set -l padding (get_padding (math $cols - (echo "$left$right" | string length)))
	printf " \x1b[38;5;124m \u2026 here be dragons\x1b[0m$padding\x1b[38;5;242m\$tty\x1b[0m\x1b[38;5;240m/$tty\n"
end
# }}}
# Distribution & Kernel Version {{{
function _motd_getdistro
	set -l rtext
	set -l text (grep "PRETTY_NAME" /etc/*release | sed -r 's/.*PRETTY_NAME="(.*)"$/\1/' | head -1)
	set -l ver (uname -r | sed -r 's/(.*)-(.*)-.*/\1-\2/')
	set -l kernel "$ver"
	switch $text
		case 'Arch*'
			printf " \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;32m ▲ \\x1b[38;5;252march\\x1b[38;5;32mlinux\\x1b[0m %-40s \\x1b[38;5;237m░░░·\\x1b[0m\\n" "$kernel"

		case 'CentOS*'
			printf " \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;199m ☼ \\x1b[38;5;226mcentos\\x1b[0m \\x1b[38;5;252m%-43s\\x1b[0m \\x1b[38;5;237m░░░·\\x1b[0m\\n" "$kernel"
		case 'Debian*'
			printf " \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;199m ₪ \\x1b[38;5;5mdebian\\x1b[0m $kernel                                     \\x1b[38;5;237m░░░·\\x1b[0m\\n"
		case 'OpenBSD*'
			printf " \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m\\x1b[38;5;199m ≈ \\x1b[38;5;226mopenbsd\\x1b[0m $kernel                                        \\x1b[38;5;237m░░░·\\x1b[0m\\n"
		case '*'
			printf "$text $kernel"
	end
end
# }}}
# Hostname & IPs {{{
function _motd_network
	if test $FISH_PLATFORM = "Linux"
		set -l iplist (string trim (hostname -i))
		set -l fullhost (hostname -f)
		printf " \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m   \\x1b[38;5;242m%-24s\\x1b[0m \\x1b[38;5;240m%-27s \\x1b[38;5;237m░\\x1b[38;5;242m:\\x1b[0m\\n" "$fullhost" "($iplist)"
	else
		set -l iplist (cat /etc/systemip)
		set -l fullhost (hostname)
		printf " \\x1b[38;5;242m│\\x1b[38;5;237m░\\x1b[0m   \\x1b[38;5;242m$fullhost\\x1b[0m \\x1b[38;5;240m%-33s \\x1b[38;5;237m░\\x1b[38;5;242m:\\x1b[0m\\n" "($iplist)"
	end
end
# }}}
# Sysinfo {{{
set -g _sysinfo_count
function _motd_sysinfo
	set -l _sysinfo_cpus
	set -l _sysinfo_vcpu
	set -l _sysinfo_ram
	set -l _sysinfo_cpu_cache
	set -l _sysinfo_cpu_speed
  switch (uname -m)
		case x86_64 x86
			set -l _sysinfo_cpu (cat /proc/cpuinfo | grep 'model name' | head -1 | cut -f3- -d ' ' |  tr -s ' ' | sed -e 's/(R)//g' -e 's/(TM)//g' -e 's/ CPU / /g' -e 's/Intel/Intel®/g' -e 's/AMD/AMD®/g')
			set _sysinfo_cpus (string split " @ " $_sysinfo_cpu)
			set _sysinfo_cpu_cache (math (awk '/cache size/ {print $4}' /proc/cpuinfo | head -n 1) / 1024)
			set _sysinfo_cpu_speed (math -s2 (awk '/cpu MHz/ {print $4}' /proc/cpuinfo | head -n 1) / 1000)
			set _sysinfo_vcpu (grep -ioP 'processor\t:' /proc/cpuinfo | wc -l)
			set _sysinfo_ram (math (awk '/DirectMap4k/ {print $2}' /proc/meminfo) + (awk '/DirectMap2M/ {print $2}' /proc/meminfo))
			set -l _sysinfo_ram2 (awk '/DirectMap1G/ {print $2}' /proc/meminfo)
			if test -n "$_sysinfo_ram2"
				set _sysinfo_ram (math $_sysinfo_ram + $_sysinfo_ram2)
			end
			set _sysinfo_ram (math -s0 $_sysinfo_ram / 1024 + 1)
			printf "      \\x1b[38;5;244mcpu\\x1b[0m\\x1b[38;5;240m/%s (%sM Cache, %sGHz)\\x1b[0m\\n" $_sysinfo_cpus[1] "$_sysinfo_cpu_cache" "$_sysinfo_cpu_speed"
		case armv7l
			switch (cat /proc/cpuinfo | awk '/^Hardware/{print $3}')
				case ODROID-XU4
					printf "      \\x1b[38;5;244mcpu0\\x1b[0m\\x1b[38;5;240m/ARM® Cortex-A15 (32K Cache, 2.0GHz)\\x1b[0m\\n"
					printf "      \\x1b[38;5;244mcpu1\\x1b[0m\\x1b[38;5;240m/ARM® Cortex-A7 (32K Cache, 1.4GHz)\\x1b[0m\\n"
				case '*'
					printf "      \\x1b[38;5;244mcpu\\x1b[0m\\x1b[38;5;240m/unknown\\x1b[0m\\n"
			end
			set _sysinfo_vcpu (grep -ioP 'processor\t:' /proc/cpuinfo | wc -l)
			set _sysinfo_ram (math -s0 (awk '/MemTotal/ {print $2}' /proc/meminfo) / 1024)
	end
	set -l _sysinfo_hdd (lsblk -nd | grep -v " rom " | awk '{print $4}')
	#printf "      \\x1b[38;5;244mcpu\\x1b[0m\\x1b[38;5;240m/%s (%s Cache, %s)\\x1b[0m\\n" "$_sysinfo_cpus" "$_sysinfo_cpu_cache" "$_sysinfo_cpu_speed"
	printf "      \\x1b[38;5;244mvcpu\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m\\n" "$_sysinfo_vcpu"
	printf "      \\x1b[38;5;244mram\\x1b[0m\\x1b[38;5;240m/%dMB\\x1b[0m\\n" "$_sysinfo_ram"
	for i in (seq (count $_sysinfo_hdd))
		printf "      \\x1b[38;5;244mdisk%d\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m\\n" $i $_sysinfo_hdd[$i]
	end
	set _sysinfo_count (math (count $_sysinfo_hdd) + 2)
end
# }}}
# Services {{{
function _motd_services
	set -l firstRun true
	set -l _services_all
	for index in (seq (count $_SERVICES))
		set -l service $_SERVICES[$index]
		set -l serviceStatus (systemctl show -p ActiveState $service | sed 's/ActiveState=//g')
		if test $serviceStatus = "active"
			set -a _services_all $service
		end
		set -l serviceStatus (systemctl show -p ActiveState $service.socket | sed 's/ActiveState=//g')
		if test $serviceStatus = "active"
			set -a _services_all $service
		end
	end
	set _sysinfo_count_end 0
	if test $_sysinfo_count -gt (math (count $_services_count) + 2)
		set -l _tmp_val (math $_sysinfo_count - (math (count $_services_count) + 4))
		if test $_tmp_val -lt 0
			set _tmp_val 0
		end
		set _sysinfo_count_end (string join "" "\\x1b[" "$_tmp_val" "B")
	end
	set -l _motd_padding (string join "" "\\x1b[" "$_sysinfo_count" "A")
	printf "$_motd_padding\\x1b[25C\\x1b[38;5;238m─│────\\x1b[38;5;235m─\\x1b[38;5;238m─\\x1b[38;5;235m─────────────────\\x1b[38;5;172mservices\\x1b[38;5;235m─┐\\x1b[0m\n"
	for index in (seq (count $_services_all))
		set -l service $_services_all[$index]
		set -l serviceStatus
		if test (systemctl show -p ActiveState $service | sed 's/ActiveState=//g') = "inactive"
			set serviceStatus (systemctl show -p SubState $service.socket | sed 's/SubState=//g')
		else
			set serviceStatus (systemctl show -p SubState $service | sed 's/SubState=//g')
		end
		switch $serviceStatus
			case running exited listening
				set serviceStatus "active"
			case '*'
				set serviceStatus "inactive"
		end
		set -l _service_length (math (string length $service) + (string length $serviceStatus) + 3)
		set -l _service_width (math 30 - $_service_length)
		set -l _service_space " "
		for i in (seq $_service_width)
			set _service_space "$_service_space "
		end
		if test $firstRun = true
			printf "\\x1b[26C\\x1b[38;5;238m│\\x1b[0m " ""
		else
			printf "\\x1b[26C\\x1b[38;5;235m│\\x1b[0m " ""
		end
		if test $serviceStatus = "active"
			printf "\\x1b[38;5;34m▪ \\x1b[38;5;244m$service$_service_space\\x1b[38;5;34m$serviceStatus\\x1b[0m"
		else
			printf "\\x1b[38;5;124m▫ \\x1b[38;5;244m$service$_service_space\\x1b[38;5;124m$serviceStatus\\x1b[0m"
		end
		if test $firstRun = true
			printf " \\x1b[38;5;235m·\\x1b[0m\n"
			set firstRun false
		else
			printf " \\x1b[38;5;238m│\\x1b[0m\n"
		end
	end
	printf "\\x1b[26C\\x1b[38;5;235m└──────────────────────·─\\x1b[38;5;242m──\\x1b[38;5;247m·─\\x1b[38;5;242m────\\x1b[38;5;247m┘\\x1b[0m\\n$_sysinfo_count_end" ""
end
# }}}
# SSL {{{
function _motd_ssl
	printf "\n\\x1b[25C\\x1b[38;5;238m─│───────────────────\\x1b[38;5;172mcertificates\\x1b[38;5;238m─┐\\x1b[0m\n" ""
	set -l _certificate_now (date +"%Y-%m-%d %H:%M:%S")
	set -l _certificate_now_timestamp (date -d "$_certificate_now" +%s)
	for index in (seq (count $_SSL_DOMAINS))
		set -l domain $_SSL_DOMAINS[$index]
		set -l certTime (openssl s_client -connect $domain:443 < /dev/null 2>/dev/null | openssl x509 -noout -enddate 2>/dev/null | cut -d= -f2)
		set -l _certificate_time (date -d "$certTime" +"%Y-%m-%d %H:%M:%S")
		set -l _certificate_timestamp (date -d "$certTime" +%s)
		set -l sign ""
		set -l ending ""
		if test $_certificate_timestamp -gt $_certificate_now_timestamp
			set sign "\\x1b[38;5;34m▪\\x1b[0m"
			set _certificate_time (datediff -f "%dd %Hh" -i "%Y-%m-%d %H:%M:%S" -i "%Y-%m-%d %H:%M:%S" "$_certificate_now" "$_certificate_time")
			set ending "\\x1b[38;5;34m$_certificate_time\\x1b[0m"
		else
			set sign "\\x1b[38;5;124m‼\\x1b[0m"
		end
		set -l _certificate_length (math (string length $domain) + (string length $_certificate_time) + 3)
		set -l _certificate_width (math 30 - $_certificate_length)
		set -l _certificate_space " "
		for i in (seq $_certificate_width)
			set _certificate_space "$_certificate_space "
		end

		printf "\\x1b[26C\\x1b[38;5;238m│\\x1b[0m " ""
		printf "$sign \\x1b[38;5;248m$domain$_certificate_space$ending"
		printf " \\x1b[38;5;238m│\\x1b[0m\n"
	end
	printf "\\x1b[26C\\x1b[38;5;235m└───────────────────·─\\x1b[38;5;242m─\\x1b[1;39m·─\\x1b[38;5;242m─\\x1b[1;39m─\\x1b[38;5;242m──────\\x1b[38;5;255m┘\\x1b[0m\\n" ""
end
# }}}

_motd_warning
cat $ANSI | sed -e 's/^/ /g'
printf " \\x1b[38;5;255m┌\\x1b[38;5;242m────\\x1b[38;5;235m─·\\x1b[38;5;242m─\x1b[38;5;235m─·─────────────────────────────────────────────────┐\\n"
_motd_getdistro
_motd_network
printf " \\x1b[38;5;235m·\\x1b[38;5;237m░\\x1b[38;5;233m── \\x1b[38;5;235m· \\x1b[38;5;242m· \\x1b[1;37m· \\x1b[38;5;242m· \\x1b[38;5;235m·\\x1b[0m \\x1b[38;5;233m───────────────────────────────────────────\\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n"
set -l _motd_uptime (uptime -p | cut -d ' ' -f2-)
printf " \\x1b[38;5;235m│\\x1b[38;5;237m░░░ \\x1b[38;5;242muptime\\x1b[38;5;240m: %-45s\\x1b[38;5;237m░\\x1b[38;5;242m│\\x1b[0m\\n" "$_motd_uptime"
printf " \\x1b[38;5;235m└─────────────────────────────────────────────·─\\x1b[38;5;242m─\\x1b[1;39m·─\\x1b[38;5;242m─\\x1b[1;39m─\\x1b[38;5;242m──────\\x1b[38;5;255m┘\\x1b[0m\\n"
if test $HOSTNAME = "web.wa.kyaulabs.com"
	_motd_ssl
end
_motd_sysinfo
set -l _lastlog_ip
set -l _lastlog (string split " " (lastlog -u $USER | sed -n 's/  */ /gp' | sed -n 2p))
if test (count $_lastlog) = 8
	set _lastlog_ip "localhost"
else
	set _lastlog_ip $_lastlog[3]
end
#set -l _lastlog (lastlog -u $USER | sed -n 2p | tr -s ' ' | cut -d ' ' -f4-)
printf "      \\x1b[38;5;244mlast\\x1b[0m\\x1b[38;5;240m/%s\\x1b[0m\\n\\n" "$_lastlog_ip"
_motd_services

# vim: ts=2 sw=2 noet :
