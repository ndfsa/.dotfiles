#!/bin/zsh

cd ~/AUR
for i in $@ ; do
    printf "================ updating $i ================\n"
    cd "./$i"
    git pull

    printf "================ making pkg $i ================\n"
    makepkg -sri

    printf "================ cleaning ================\n"
    git clean -xffd
    cd ../
done
