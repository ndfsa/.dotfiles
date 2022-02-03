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
alias wp-pull='rclone sync gdrive_crypt:Pictures/Wallpapers $HOME/Pictures/Wallpapers -P'
alias wp-push='rclone sync $HOME/Pictures/Wallpapers gdrive_crypt:Pictures/Wallpapers -P'
alias book-pull='rclone sync gdrive_crypt:Documents/Books $HOME/Documents/Books -P'
alias book-push='rclone sync $HOME/Documents/Books gdrive_crypt:Documents/Books -P'
alias :q='exit' # I'm done with this
alias nvsc='nvim --cmd "set buftype=nofile"'
