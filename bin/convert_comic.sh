#!/bin/bash

# check if the argument is empty
[[ -z "$1" ]] && exit 1

# check if the file/directory exists
[[ ! -e "./$1" ]] && exit 2

# check if current directory is not home
[[ `pwd` -ef "$HOME" ]] && exit 3

if [[ -d "./$1" ]]
then
    # extract directory name
    directory=$(basename "$1")
    echo "processing directory $directory"

    # convert directory into a comic book file
    zip -rjm "$directory.cbz" "./$directory" || exit 1

    # remove directory
    rm -rd "$directory"

    # unset variable
    unset directory
else
    # extract file name
    file=$(basename "$1")
    echo "processing file $file"

    # extract name without the extension
    name="${file%.*}"

    # extract zip file
    unzip "$file" -d "$name" || exit 1

    # remove original
    rm "$file"

    # convert directory into a comic book file
    zip -rjm "${name}.cbz" "./$name"

    # remove directory
    rm -rd "$name"

    # unset variables
    unset file
    unset name
fi
