# ~/.xinitrc: executed by startx(1) to launch your window manager
#
# Author:  kyau
# Version: 0.1
# Date:    2013-04-10T03:37:21-0700


# General ----------------------------------------------------------------------

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


# Keyboard/Mouse ---------------------------------------------------------------

# Set the expected left-pointer
xsetroot -cursor_name left_ptr &

# Disable mouse acceleration
xset m 1/5 1

# Set a typematic delay of 250ms with a repeating rate of 60Hz
xset r rate 250 60

# Swap <caps> with <esc>
#setxkbmap -option caps:swapescape

# NVIDIA settings
#nvidia-settings -a GlyphCache=1
#nvidia-settings -a InitialPixmapPlacement=2

# This will key board CLIPBOARDs in sync
if [ -x /usr/bin/autocutsel ]; then 
    #this will keep the clipboard in sync 
    #   with the primary buffer 
    autocutsel -selection CLIPBOARD -fork
    #this will keep the primary in sync 
    #   with the clipboard buffer 
    autocutsel -selection PRIMARY -fork 
fi

# Launch the window manager supplied by the command line arguments or
# optionally default to openbox
case $1 in
    xmonad) exec xmonad;;
    openbox) exec openbox-session;;
    i3);;
    *) exec i3 -V >> ~/.i3/i3-$(date +'%F-%k-%M-%S').log 2>&1;;
esac

# vim:ft=sh
