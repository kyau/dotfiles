# ~/.bashrc: executed by bash(1) for non-login shells.
#
# Author:  kyau
# Version: 0.2
# Date:    2013-05-11T19:57:55-0400


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# General ----------------------------------------------------------------------

# Should an ssh-agent be auto-started
# SSH_AGENT_START=true

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
export HOSTNAME=`hostname`
export IRCNAME="http://kyau.net/"
export IRCNICK="kyau"
export VISUAL="$EDITOR"

# Pager
export PAGER="less"
export LESS="-F -g -i -M -R -S -w -X -z -4"



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

# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]
    then
        STAT=`parse_git_dirty`
        echo -e " \e[1;35m\ue725${BRANCH}\e[0m${STAT}"
    else
        echo -e ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits="\e[31m\uf07e\e[0m${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="\e[31m\uf12a\e[0m${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="\e[31m\uf44d\e[0m${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits=" \e[31m\uf128\e[0m${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits=" \e[31m\uf00d\e[0m${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits=" \e[31m\uf069\e[0m${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo -e "${bits}"
    else
        echo -e ""
    fi
}

function insert_break() {
    #echo -en " \u667a" # wisdom
    #echo -en " \u6c38" # eternal/forever
    echo -e ""
}

function end_prompt() {
    echo -e "\uf054"
}

# Change the way the prompt is displayed                                         
#export PS1="[\u@\h \W]\$ "
#export PS1="\[\e[1;34m\]\u\[\e[0m\]\[\e[38m\]\`insert_break\`\[\e[0m\] \[\e[1;36m\]\w\[\e[0m\]\`parse_git_branch\` \`end_prompt\` "
if ! xset q &>/dev/null; then
    export PS1="[\u@\h \W]\$ "
else
    export PS1="\[\e[1;34m\]\u\[\e[0m\]\[\e[38m\]\[\e[0m\] \[\e[1;36m\]\w\[\e[0m\]\`parse_git_branch\`\n\[\e[1;33m\]\#\[\e[0m\] \`end_prompt\` "
fi

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
