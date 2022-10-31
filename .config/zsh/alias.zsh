function __scoped_edit(){
    M_LAST_CWD="`pwd`"
    cd "$1"
    nvim .
    cd "$M_LAST_CWD" 2> /dev/null || cd "$HOME"
    unset M_LAST_CWD
}

alias ls='exa --icons --sort=type'
alias la='ls -a'
alias lsl='ls -l --group'
alias lal='la -l --group'
alias ip='ip --color=auto'
alias rm='trash'
function ci() {
    __zoxide_zi "$@"
}
function cd(){
    __zoxide_z "$@"
}
function mkcd(){
    __DIR_NAME=$1
    mkdir $1 && cd $1
}
alias conf='__scoped_edit $HOME/.dotfiles/'
alias wp-pull='rclone sync gdrive_crypt:Pictures/Wallpapers $HOME/Pictures/Wallpapers -P'
alias wp-push='rclone sync $HOME/Pictures/Wallpapers gdrive_crypt:Pictures/Wallpapers -P'
alias book-pull='rclone sync gdrive_crypt:Documents/Books $HOME/Documents/Books -P'
alias book-push='rclone sync $HOME/Documents/Books gdrive_crypt:Documents/Books -P'
alias :q='exit' # I'm done with this
