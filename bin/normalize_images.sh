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
    $(sxiv $i &> /dev/null) && \
    select ds in "$OPTS[@]"
    do
        [ -z "$ds" ] && echo "Invalid selection" && continue
        echo "Applying ${ds:l} to $i"
        case $ds in
            'Sharpening filter')
                normalize "$i" 0.3
                ;;
            'Blur filter')
                normalize "$i" 0.7
                ;;
        esac
        echo "Removing $i"
        rm "$i"
        break
    done
done