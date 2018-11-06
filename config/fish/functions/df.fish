# $Arch: df.fish,v 1.000 2018/10/01 21:59:04 kyau Exp $

function df
    echo "Filesystem            Type  Size  Used Avail Use% Mounted on"
    /bin/df -Th --sync --total -x devtmpfs -x tmpfs -x overlaid | sed -r 's/^([a-z0-9/-]+) /\x1b[38;5;238m\1 \x1b[38;5;130m/' | sed -r 's/([0-9]+%)/\x1b[38;5;32m\1\x1b[38;5;85m/' | sed -r 's/([0-9|.]+[K|M|G|T|P])/\x1b[38;5;244m\1/g' | tail -n +2 | sort -k 1
    return 0
end
