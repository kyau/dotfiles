export DOTFILES="$HOME/dotfiles"
#export TERM="rxvt-256color"

# Editor
export EDITOR="vim"
export VISUAL="vim"

# Pager
export PAGER="less"
export LESS="-F -g -i -M -R -S -w -X -z -4"

# Shell History
export HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

# Path
typeset -U path
path=(~/bin /usr/local/bin $path[@])

# IRC
export EMAIL="kyau@kyau.org"
export HOSTNAME=`hostname`
export IRCNAME="http://kyau.net/"
export IRCNICK="kyau"

# Make BSD/Mac utils use colors
export CLICOLOR=1

# Change the way ls sorts
export LC_COLLATE="C"

