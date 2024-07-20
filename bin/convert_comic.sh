#!/bin/bash

# check if the argument is empty
[[ -z "$1" ]] && exit 1

# check if the file/directory exists
[[ ! -e "./$1" ]] && exit 2

if [[ -d "./$1" ]]
then
    # extract directory name
    directory=$(basename "$1")
    echo "processing directory $directory"

    # convert directory into a comic book file
    zip -rjm "$directory.cbz" "./$directory"

    # remove directory
    rm -rd "$directory"
else
    # extract file name
    file=$(basename "$1")
    echo "processing file $file"

    # extract name without the extension
    name="${file%.*}"

    # extract zip file
    unzip "$file" -d "$name"

    # remove original
    rm "$file"

    # convert directory into a comic book file
    zip -rjm "${name}.cbz" "./$name"

    # remove directory
    rm -rd "$name"
fi
