# profiling for performance
# zmodload zsh/zprof

### Options
ZCACHES=$XDG_CACHE_HOME/zsh
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=$ZCACHES/history

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST

### Completion
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit -d $ZCACHES/zcompdump

zstyle ':completion:*' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' complete-options true
zstyle ':completion:alias-expension:*' completer _expand_alias
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

setopt menu_complete

### Alias
function __scoped_edit(){
    M_LAST_CWD="`pwd`"
    cd "$1"
    nvim .
    cd "$M_LAST_CWD" 2> /dev/null || cd "$HOME"
    unset M_LAST_CWD
}

function rm(){
    trash $@
}

alias ls='exa --icons --sort=type --classify'
alias la='ls -a'
alias lsl='ls -l'
alias lal='lsl -a'
alias ip='ip --color=auto'
alias xsc='xclip -selection c'
function mkcd(){
    __DIR_NAME=$1
    mkdir $1 && cd $1
}
alias conf='__scoped_edit $HOME/.dotfiles/'
alias note='__scoped_edit $HOME/Documents/notes/'
alias wp-pull='rclone sync gdrive_crypt:Pictures/Wallpapers $HOME/Pictures/Wallpapers -P'
alias wp-push='rclone sync $HOME/Pictures/Wallpapers gdrive_crypt:Pictures/Wallpapers -P'
alias book-pull='rclone sync gdrive_crypt:Documents/Books $HOME/Documents/Books -P'
alias book-push='rclone sync $HOME/Documents/Books gdrive_crypt:Documents/Books -P'
alias :q='exit' # I'm done with this

### Functions
sudo-command() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudoedit\ * ]]; then
        LBUFFER="nvim ${LBUFFER#sudoedit }"
    elif [[ $BUFFER == sudo\ * ]]; then
        LBUFFER="${LBUFFER#sudo }"
    elif [[ $BUFFER == nvim\ * ]]; then
        LBUFFER="sudoedit ${LBUFFER#nvim }"
    else
        LBUFFER="sudo $LBUFFER"
    fi
}

swap-command() {
    if [[ $BUFFER == ls\ * ]]; then
        LBUFFER="bat ${LBUFFER#ls }"
    elif [[ $BUFFER == bat\ * ]]; then
        LBUFFER="nvim ${LBUFFER#bat }"
    elif [[ $BUFFER == nvim\ * ]]; then
        LBUFFER="cp ${LBUFFER#nvim }"
    elif [[ $BUFFER == cp\ * ]]; then
        LBUFFER="mv ${LBUFFER#cp }"
    elif [[ $BUFFER == mv\ * ]]; then
        LBUFFER="touch ${LBUFFER#mv }"
    elif [[ $BUFFER == touch\ * ]]; then
        LBUFFER="mkdir ${LBUFFER#touch }"
    elif [[ $BUFFER == mkdir\ * ]]; then
        LBUFFER="ls ${LBUFFER#mkdir }"
    fi
}

zle -N sudo-command
zle -N swap-command

## History search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

### Keymap
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

bindkey -e

# setup key accordingly
[[ -n "${key[Home]}" ]] && bindkey -- "${key[Home]}" beginning-of-line
[[ -n "${key[End]}" ]] && bindkey -- "${key[End]}" end-of-line
[[ -n "${key[Insert]}" ]] && bindkey -- "${key[Insert]}" overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}" ]] && bindkey -- "${key[Delete]}" delete-char
[[ -n "${key[Up]}" ]] && bindkey -- "${key[Up]}" up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
[[ -n "${key[Left]}" ]] && bindkey -- "${key[Left]}" backward-char
[[ -n "${key[Right]}" ]] && bindkey -- "${key[Right]}" forward-char
[[ -n "${key[PageUp]}" ]] && bindkey -- "${key[PageUp]}" beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]] && bindkey -- "${key[PageDown]}" end-of-buffer-or-history
[[ -n "${key[Control-Left]}" ]] && bindkey -- "${key[Control-Left]}" backward-word
[[ -n "${key[Control-Right]}" ]] && bindkey -- "${key[Control-Right]}" forward-word

bindkey "^[s" sudo-command
bindkey "^[c" swap-command
bindkey "^N" menu-complete
bindkey "^P" reverse-menu-complete
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

### Programs
eval "$(zoxide init --cmd cd zsh)"

if [ $TERM != "linux" ]; then
    eval "$(starship init zsh)"
else
    setopt prompt_subst

    case ${TERM} in
        linux*|screen*)
            PS1=' %F{5}%~%f %F{4}>%f '
            ;;
    esac
fi

### Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# profiling end
# zprof
