#!/bin/bash
palette="/tmp/palette.png"
filters="fps=15,scale=1280:-1:flags=lanczos"

ffmpeg -i "$1" -vf "$filters,palettegen" -y $palette
ffmpeg -i "$1" -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y output.gif