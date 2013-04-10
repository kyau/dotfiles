# ~/.bashrc: executed by bash(1) for non-login shells.
#
# Author:  kyau
# Version: 0.1
# Date:    2013-04-10T04:59:36-0700


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# General ----------------------------------------------------------------------

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable core dumping                                                            
ulimit -c unlimited

# Set custom binary path
export PATH="$HOME/bin:$PATH"

# Basic user variables
export EDITOR="vim"
export EMAIL="kyau@kyau.org"
export IRCNAME="http://kyau.net/"
export IRCNICK="kyau"
export VISUAL="$EDITOR"


# History ----------------------------------------------------------------------

# Ignore commands beginning with space and delete previous duplicates upon
# new command addition
export HISTCONTROL=ignoreboth:erasedups

# Append to the history file, don't overwrite it
shopt -s histappend

# Set history limit to 5000 commands
export HISTFILESIZE=5000
export HISTSIZE=5000


# Colors/Prompt ----------------------------------------------------------------

# Make BSD/Mac utils use colors
export CLICOLOR=1

# Change the way ls sorts
export LC_COLLATE="C"

# Change the way the prompt is displayed                                         
export PS1="[\u@\h \W]\$ "

# The Linux console supports the "ESC ] P nrrggbb" escape sequence to change
# the terminal's color palette.
if [ "$TERM" = 'linux' ]; then
    # Read my colors as defined in the Rxvt config, convert and set them.
    sed -n -e 's/^Rxvt\.color\([0-9]*\): *#\([0-9a-f]*\)$/\1:\2/p' "$HOME/.Xresources" |
    while read -r line; do
        idx="$(printf '%x' "$(echo "$line" | cut -d : -f 1)")";
        col="$(echo "$line" | cut -d : -f 2)";
        echo -n "]P$idx$col"
    done
fi

# Scripts ----------------------------------------------------------------------

# Load all scripts in ~/.bash.d/
for i in $HOME/.bash.d/*;
    do . $i;
done

# vim:ft=sh
