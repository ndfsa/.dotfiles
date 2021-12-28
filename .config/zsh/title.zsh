case $TERM in
    *xterm*|alacritty|kitty|st*|rxvt*)
        precmd () {
			printf "\033]0;%s\007" "`pwd`"
        }
        preexec () {
            printf "\033]0;%s %s\007" "`pwd`" "$1"
        }
        ;;
esac
