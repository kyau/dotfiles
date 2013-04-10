# ~/.bashrc: executed by bash(1) for non-login shells.
#
# Author:  kyau
# Version: 0.1
# Date:    2013-04-10T02:45:39-0700


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# General ----------------------------------------------------------------------

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Enable core dumping                                                            
ulimit -c unlimited

# Set custom binary path
export PATH='$HOME/bin:$PATH'

# Basic user variables
export EDITOR='vim'
export EMAIL='kyau@kyau.org'
export IRCNAME='http://kyau.net/'
export IRCNICK='kyau'


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

# Change the way the prompt is displayed                                         
export PS1='[\u@\h \W]\$ '


# Scripts ----------------------------------------------------------------------

# Load all scripts in ~/.bash.d/
for i in $HOME/.bash.d/*;
    do . $i;
done

# vim:ft=sh
