#!/bin/zsh

mkdir normalized
parallel -j 6 magick mogrify \
    -define webp:lossless=true \
    -format webp \
    -alpha off \
    -path ./normalized \
    ::: ${@}
cd normalized
img-cmp rename *
cd ..
