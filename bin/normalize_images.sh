#!/bin/zsh

OPTS=('Sharpening filter' 'Blur filter')

function normalize(){
    magick "$1" \
        -alpha off \
        -strip \
        -colorspace RGB \
        -filter Cubic \
        -define filter:B="$2" \
        -define png:compression-level=9 \
        -distort Resize "2560x1440^" \
        -colorspace sRGB "$HOME/Pictures/Converted/${1%%.*}.png"
}

for i in "$@"
do
    normalize "$i" 0.33
    rm "$i"
done
