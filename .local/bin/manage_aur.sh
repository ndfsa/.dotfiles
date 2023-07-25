#!/bin/zsh

if [[ "AUR" != ${PWD##*/} ]]
then
    printf "not in AUR directory\n"
    exit
fi

function update() {
    for i in $@ ; do
        printf "================ updating $i ================\n"
        cd "./$i"
        git pull
        cd ../
    done
}

function upgrade() {
    for i in $@ ; do
        printf "================ making pkg $i ================\n"
        cd "./$i"
        makepkg -sri
        cd ../
    done
}

function clean() {
    for i in $@ ; do
        printf "================ cleaning ================\n"
        cd "./$i"
        git clean -xffd
        cd ../
    done
}

case $1 in
    update)
        func="update"
        shift
        ;;
    upgrade)
        func="upgrade"
        shift
        ;;
    clean)
        func="clean"
        shift
        ;;
    *)
        printf "no such command: %s\n" $1
        exit
        ;;
esac

$func $@
