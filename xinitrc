# $KYAULabs: xinitrc,v 1.0.6 2020/01/11 23:43:23 kyau Exp $

# General {{{
# Update xorg resources if needed
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap
# Turn hardware bell off
xset -b
# Load all fonts
xset +fp /usr/share/fonts/local
xset +fp ~/.fonts
xset fp rehash
export FT2_SUBPIXEL_HINTING=1
# }}}
# Keyboard/Mouse {{{
# Set the expected left-pointer
xsetroot -cursor_name left_ptr &
# Disable mouse acceleration
xset m 1/5 1
# Set a typematic delay of 250ms with a repeating rate of 60Hz
xset r rate 250 60
# Swap <caps> with <esc>
#setxkbmap -option caps:swapescape
# }}}
# Auto-Start {{{
# Wallpaper
nitrogen --restore
# Clipboard
if [ -x /usr/bin/autocutsel ]; then 
	autocutsel -selection PRIMARY -fork
fi
# Hide mouse after 2 seconds of no use (except on background)
unclutter --fork --timeout 2 --jitter 5 --ignore-scrolling --exclude-root &
# Start pulseaudio session
start-pulseaudio-x11
# Corsair Keyboard
ckb-next -bc &
# Notifications
dunst &
# Enable Compositing
picom -bc &
# Turn numlock on
numlockx on &
# }}}
# WM Selection {{{
case $1 in
	xmonad) exec xmonad;;
	openbox) exec openbox-session;;
	i3);;
	*) exec i3 -V >> ~/.i3/i3-$(date +'%F-%k-%M-%S').log 2>&1;;
esac
# }}}

# vim: ft=sh ts=2 sw=2 noet :
