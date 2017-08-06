function shell
		set -l shel (echo "$SHELL" | sed -r 's/.*\/(.*)/\1/')
    set -l ANSI $HOME/bin/$shel.ans
    set -l VER (fish -v)
    cat $ANSI
    printf "  \\x1b[0;37m%s\\x1b[0m\\n\\n" "$VER"
end
