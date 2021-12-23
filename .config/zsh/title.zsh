case $TERM in
    *xterm*|alacritty|kitty|st*|rxvt*)
        precmd () {
			printf "\033]0;`pwd`\007"
        }
        preexec () {
            printf "\033]0;`pwd` $1\007"
        }
        ;;
esac
