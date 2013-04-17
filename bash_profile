# ~/.bash_profile: executed by bash(1) for login shells.
#
# Author:  kyau
# Version: 0.1
# Date:    2013-04-17T13:46:10-0700

# If .bashrc exists source upon login
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Additional login display
uname -vrs
uptime
echo
mail
