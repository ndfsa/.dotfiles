cd ~/AUR
for i in $(/bin/ls)
do
    cd "./$i"
    git pull
    makepkg -sri
    git clean -xffd
    cd ../
done
