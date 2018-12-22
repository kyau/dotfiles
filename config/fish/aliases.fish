# $Arch: aliases.fish,v 1.002 2017/08/28 11:50:56 kyau Exp $

# Abbreviations {{{
abbr -a -- - 'cd -'
# }}}
# Aliases: Navigation {{{
# Navigation
alias c="clear"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# }}}
# Aliases: Miscellaneous {{{
alias bc="bc -l"
#alias df="df -Th --sync --total -x devtmpfs -x tmpfs -x overlaid | sed -r 's/^([a-z0-9/-]+) /\x1b[38;5;238m\1 \x1b[38;5;130m/' | sed -r 's/([0-9]+%)/\x1b[38;5;32m\1\x1b[38;5;85m/' | sed -r 's/([0-9|.]+[K|M|G|T|P])/\x1b[38;5;244m\1/g' | tail -n +2 | sort -k 1"
alias diff="colordiff -u"
alias du="du -ch"
alias edit="$EDITOR"
alias g="grep"
alias grep="grep --color=auto --exclude-dir=\.git --exclude-dir=\.svn --exclude-dir=\.hg"
alias h="history"
alias motd="source $HOME/.config/fish/motd.fish"
alias nssh="ssh -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no"
alias scp="scp -q"
alias tmux="tmux -2 -u"
alias vi="$EDITOR"
alias wget="wget -c"
# }}}
# Aliases: Directory Listing {{{
alias ls="ls --color=auto --file-type --group-directories-first"
alias lsa="ls -A"
alias lla="ls -Al --human-readable"
alias lld="ls -At1"
alias ll="ls -l --human-readable"
# }}}
# Aliases: Security, Permission & Ownership {{{
alias chgrp="chgrp --preserve-root"
alias chmod="chmod --preserve-root"
alias chown="chown --preserve-root"
alias cp="cp -i"
alias k="kill"
alias k1="kill -1"
alias k2="kill -2"
alias k9="kill -9"
alias ln="ln -i"
alias mkdir="mkdir -pv"
alias mv="mv -i"
alias rm="rm -I --preserve-root"
# }}}
# Aliases: Git {{{
alias commit="git commit -a"
alias gitad="git add -A -n ."
alias gitadd="git add -A ."
alias gitlog="git log --graph --all --format=format:'%C(bold red)%h%C(reset) %C(white)-%C(reset) %C(reset)%s %C(bold green)(%ar)%C(reset) %C(bold cyan)[%an]%C(reset)%C(bold yellow)%d%C(reset)%n''''    %C(white)%b%C(reset)' --no-abbrev-commit"
alias gitls="git ls-files -o --exclude-standard"
alias pull="git pull origin"
alias push="git push origin"
# }}}
# Aliases: QEMU {{{
alias virsh="virsh -c qemu:///system"
# }}}
# Aliases: ARK {{{
alias ark="/home/kyau/bin/arkmanager"
# }}}
