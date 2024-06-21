#!/bin/bash

# check if the argument is empty
[[ -z "$1" ]] && exit 1

# get the directory filename
file=$(basename "$1")

# check if the file/directory exists
[[ ! -e "./$file" ]] && exit 2

if [[ -d "./$file" ]]
then
    echo "processing directory $file"

    # convert all images into jpgXL
    find "./$file" -type f | parallel -j8 "magick mogrify -format jxl {1}"

    # remove not jxl files
    find "./$file" -type f -not -name "*.jxl" -delete

    # convert directory into a comic book file
    zip -rjm "$file.cbz" "./$file"

    # remove directory
    rm -rd "$file"
else
    echo "processing file $file"

    # temporary directory
    dir="${file%.*}"

    # extract zip file
    unzip "$file" -d "$dir"

    # remove original
    rm "$file"

    # convert all images into jpgXL
    find "./$dir" -type f | parallel -j8 "magick mogrify -format jxl {1}"

    # remove not jxl files
    find "./$dir" -type f -not -name "*.jxl" -delete

    # convert directory into a comic book file
    zip -rjm "$file" "./$dir"

    # remove directory
    rm -rd "$dir"
fi
