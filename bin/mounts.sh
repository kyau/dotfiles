#!/bin/bash

if [[ -z $1 ]]; then
    echo "Invalid argument: please specify which mounts (chloe/x220)"
    exit 1
fi
if [ "$1" == "chloe" ]; then
    sudo mount /dev/sdb2 /mnt/archive -o uid=1000,gid=10,fmask=0177,dmask=0077
    #sshfs cloud9@dark:/home/cloud9/public_html /home/kyau/public_html
fi
if [ "$1" == "x220" ]; then
    sudo mount -t cifs //chloe/ARCHiVE /mnt/archive --verbose -o user=Kyau,uid=1000,gid=100,file_mode=0660,dir_mode=0770,noperm
fi
