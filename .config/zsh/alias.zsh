function __scoped_edit(){
    M_LAST_CWD="`pwd`"
    cd "$1"
    nvim .
    cd "$M_LAST_CWD"
    unset M_LAST_CWD
}

alias ls='exa --icons --sort=type'
alias la='ls -a'
alias lsl='ls -l --group'
alias lal='la -l --group'
alias ip='ip --color=auto'
alias t='trash'
alias cdi=__zoxide_zi
alias cd=__zoxide_z
alias conf='__scoped_edit $HOME/.dotfiles/'
alias note='__scoped_edit $HOME/Documents/notes/'
alias wp-pull='rclone sync gdrive_crypt:Pictures/Wallpapers ~/Pictures/Wallpapers -P'
alias wp-push='rclone sync ~/Pictures/Wallpapers gdrive_crypt:Pictures/Wallpapers -P'
alias :q='exit' # I'm done with this
