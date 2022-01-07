function _scoped_edit(){
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
alias cd='z'
alias conf='_scoped_edit $HOME/.dotfiles/'
alias note='_scoped_edit $HOME/Documents/notes/'
alias wp-pull='rclone sync gdrive_crypt:Pictures ~/Pictures -P'
alias wp-push='rclone sync ~/Pictures gdrive_crypt:Pictures -P'
alias :q='exit' # I'm done with this
