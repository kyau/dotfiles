# $Arch: aliases-bsd.fish,v 1.002 2017/08/20 15:42:10 kyau Exp $

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
alias df="df -h | sed -r 's/^([a-z0-9/-]+) /[38;5;238m\1 [38;5;130m/' | sed -r 's/([0-9]+%)/[38;5;32m\1[38;5;85m/' | sed -r 's/([0-9|.]+[K|M|G|T|P])/[38;5;244m\1/g' | tail -n +2 | sort -k 1"
alias diff="colordiff -u"
alias du="du -ch"
alias edit="$EDITOR"
alias g="grep"
alias h="history"
alias man="man -m /usr/share/man"
alias motd="source $HOME/.config/fish/motd.fish"
alias nssh="ssh -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no"
alias tmux="tmux -u"
alias vi="$EDITOR"
alias wget="wget -c"
# }}}
# Aliases: Directory Listing {{{
alias ls="colorls -G"
alias lsa="ls -A"
alias lla="ls -Alh"
alias lld="ls -At1"
alias ll="ls -lh"
# }}}
# Aliases: Security, Permission & Ownership {{{
alias cp="cp -i"
alias k="kill"
alias k1="kill -1"
alias k2="kill -2"
alias k9="kill -9"
alias mkdir="mkdir -p"
alias mv="mv -i"
alias rm="rm -i"
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
