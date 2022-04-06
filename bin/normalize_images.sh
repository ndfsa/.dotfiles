#!/bin/zsh

mkdir normalized
for i in "$@"
do
    magick mogrify \
        -define png:compression-level=9 \
        -format png \
        -alpha off \
        -strip \
        -colorspace RGB \
        -filter Cubic \
        -define filter:B=0.33 \
        -distort Resize "2560x1440^" \
        -colorspace sRGB \
        -path ./normalized \
        "$i"
done
cd normalized
img-cmp rename *
cd ..
