#!/bin/dash

configs=".Xresources
.config/emacs/init.el
.config/starship.toml
.config/systemd/user/wm.target
.config/systemd/user/wallpaper.service
.config/systemd/user/wallpaper.timer
.prboom-plus/prboom-plus.cfg
.xinitrc
.xserverrc
.zlogin
.zshenv
.zshrc
.config/alacritty
.config/bspwm
.config/dunst
.config/doom
.config/nvim
.config/picom
.config/polybar
.config/rofi
.config/rustfmt
.config/sxhkd
.config/sxiv
.config/wezterm
.config/zathura
.config/zsh
bin"

dir_list=""
file_list=""

# link all config files
for i in $configs; do
    if [ -d "$HOME/.dotfiles/$i" ]; then
        dir_list="$dir_list $i"
    elif [ -f "$HOME/.dotfiles/$i" ]; then
        file_list="$file_list $i"
    fi
done

for file in $file_list; do
    filename=$(basename $file)
    parent=$(echo "$file" | sed "s/$filename//")

    [ "$filename" != "$file" ] \
        && [ ! -d "$parent" ] \
        && mkdir --parent $HOME/$parent

    ln -sv $HOME/.dotfiles/$file $HOME/$parent
done

unset parent

for dir in $dir_list; do
    dirname=$(basename $dir)
    parent=$(echo "$dir" | sed "s/$dirname//")

    [ "$dirname" != "$dir" ] \
        && [ ! -d "$parent" ] \
        && mkdir --parent $HOME/$parent

    ln -sv $HOME/.dotfiles/$dir $HOME/$parent
done

# install things from AUR
AUR_DIR=$HOME/AUR
git clone https://aur.archlinux.org/font-symbola.git $AUR_DIR/font-symbola
git clone https://aur.archlinux.org/jdtls.git $AUR_DIR/jdtls
git clone https://aur.archlinux.org/neovim-nightly-bin.git $AUR_DIR/neovim-nightly-bin
git clone https://aur.archlinux.org/prboom-plus.git $AUR_DIR/prboom-plus
git clone https://aur.archlinux.org/atool-git.git $AUR_DIR/atool-git
git clone https://aur.archlinux.org/clojure-lsp-bin.git $AUR_DIR/clojure-lsp-bin
git clone https://aur.archlinux.org/insomnia-bin.git $AUR_DIR/insomnia-bin
git clone https://aur.archlinux.org/spotify.git $AUR_DIR/spotify
git clone https://aur.archlinux.org/zls-bin.git $AUR_DIR/zls-bin
