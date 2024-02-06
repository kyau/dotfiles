# $KYAULabs: config-msys64.fish,v 1.0.2 2022/11/23 18:27:36 kyau Exp $

# Null the default fish greeting
set fish_greeting

# Set the platform variable
set -x FISH_PLATFORM (uname -s)

# Set the window title
function fish_title
    set -l _fish_hostname (hostname)
    echo "$_fish_hostname:" $_ ' '
    dirs
end

# Aliases
function aliases -d "Command Aliases"
    alias c="clear"
    alias cd..="cd .."
    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."
    alias bc="bc -l"
    alias diff="colordiff -u"
    alias du="du -ch"
    alias edit="$EDITOR"
    alias g="grep"
    alias grep="grep --color=auto --exclude-dir=\.git --exclude-dir=\.svn --exclude-dir=\.hg"
    alias h="history"
    alias nssh="ssh -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no"
    alias scp="scp -q"
    alias nscp="scp -oUserKnownHostsFile=/dev/null -oStrictHostKeyChecking=no"
    alias tmux="tmux -2 -u"
    alias vi="$EDITOR"
    alias wget="wget -c"
    alias ls="ls --color=auto --file-type --group-directories-first"
    alias lsa="ls -A"
    alias lla="ls -Al --human-readable"
    alias lld="ls -At1"
    alias ll="ls -l --human-readable"
    alias cp="cp -i"
    alias k="kill"
    alias k1="kill -1"
    alias k2="kill -2"
    alias k9="kill -9"
    alias ln="ln -i"
    alias mkdir="mkdir -pv"
    alias mv="mv -i"
    alias rm="rm -I --preserve-root"
end
function aliases_git -d "Git Command Aliases"
    alias commit="git commit -S -a"
    alias gitad="git add -A -n ."
    alias gitadd="git add -A ."
    alias gitlog="git log --graph --all --format=format:'%C(bold red)%h%C(reset) %C(white)-%C(reset) %C(reset)%s %C(bold green)(%ar)%C(reset) %C(bold cyan)[%an]%C(reset)%C(bold yellow)%d%C(reset)%n''''    %C(white)%b%C(reset)' --no-abbrev-commit"
    alias gitls="git ls-files -o --exclude-standard"
    alias pull="git pull origin"
    alias push="git push origin"
end

# Interactive shell
if status --is-interactive
    # environmental variables
    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    set -x EDITOR "subl -w"
    set -x PATH "$HOME/bin" "/c/Program Files/Sublime Text" "/mingw64/bin" "/opt/bin" $MSYS2_PATH "/c/ProgramData/chocolatey/bin" "/c/Program Files/dotnet" "/c/ProgramData/chocolatey/lib/mpv.install/tools" $ORIGINAL_PATH
    set -x PAGER "less"
    set -x LESS "-RSM~gIsw"
    set -x DOTNET_CLI_TELEMETRY_OPTOUT 1
    # gpg-agent + scdaemon check
    ps -eaf | grep scdaemon >/dev/null 2>&1
    if test $status -eq 1
        set -l _gpg_pid (ps | grep -i gpg-agent | awk '{ print $1 }')
        if test -n "$_gpg_pid"
            kill -9 $_gpg_pid
            gpg --card-status >/dev/null 2>&1
        end
    end
    # command aliases
    aliases
    aliases_git
    starship init fish | source
end
