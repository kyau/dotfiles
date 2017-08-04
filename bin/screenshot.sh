#! /bin/bash

scrot -c -d 10 -m '%Y-%m-%d_%H%M%S_$wx$h.png' -e 'mv $f ~/.screenshots/'
