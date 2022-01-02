case $TERM in
    *xterm*|alacritty|kitty|st*|rxvt*)
        precmd () {
			printf "\033]0;%s\007" "`pwd`"
        }
        ;;
esac
