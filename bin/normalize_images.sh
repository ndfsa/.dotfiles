#!/bin/zsh

mkdir normalized
parallel -j 6 magick mogrify \
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
    ::: ${@}
cd normalized
img-cmp rename *
cd ..
