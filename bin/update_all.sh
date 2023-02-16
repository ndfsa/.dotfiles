cd ~/AUR
for i in $(/bin/ls)
do
    case $i in
        $@)
            printf "skipping $i\n"
            ;;
        *)
            printf "=== updating $i ===\n"
            cd "./$i"
            git pull
            makepkg -sri
            git clean -xffd
            cd ../
            ;;
    esac
done
