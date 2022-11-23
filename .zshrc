# profiling for performance
#zmodload zsh/zprof

### XDG spec
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_BIN_HOME="$HOME/.local/bin"

export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME='base16'
export PAGER='bat'
export BROWSER='firefox'
export LS_COLORS='di=1;34:ln=36:so=1;31:pi=33:ex=1;32:bd=1;33:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export SXHKD_SHELL=dash
export JDTLS_HOME=/usr/share/java/jdtls
export FZF_DEFAULT_OPTS='--color=16'
export DIFFPROG='nvim -d'

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export NPM_CONFIG_PREFIX="$HOME/.local"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export LEIN_HOME="$XDG_DATA_HOME"/lein
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME/go"

### Custom paths
CUSTOM_PATHS=(
    $CARGO_HOME/bin
    $GOPATH/bin
    $HOME/.local/bin
    $HOME/bin
)
for i in $CUSTOM_PATHS[@]
do
    case ":$PATH:" in
        *":$i:"*) ;;
        *) PATH="$i:$PATH";;
    esac
done

### Options
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
HISTCONTROL=ignoreboth
WORDCHARS='~!#$%^&*(){}[]<>?.+-'

setopt HIST_IGNORE_DUPS
setopt EXTENDED_GLOB
setopt HIST_IGNORE_SPACE
setopt AUTO_MENU

### Completion
fpath=(/usr/share/zsh/site-functions $fpath)
autoload -zU compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

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

alias ls='exa --icons --sort=type'
alias la='ls -a'
alias lsl='ls -l --group'
alias lal='la -l --group'
alias ip='ip --color=auto'
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

### Keymap
if [[ -f ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE} ]]; then
    source ~/.zkbd/$TERM-${DISPLAY:-$VENDOR-$OSTYPE}
else
    autoload -Uz zkbd
    echo "WARNING Keybindings may not be set correctly!"
    echo "Execute \`zkbd\` to create bindings."
fi
bindkey -e

## History search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
zle -C alias-expension complete-word _generic

# setup key accordingly
[[ -n "${key[Home]}"        ]] && bindkey -- "${key[Home]}"           beginning-of-line
[[ -n "${key[End]}"         ]] && bindkey -- "${key[End]}"            end-of-line
[[ -n "${key[Insert]}"      ]] && bindkey -- "${key[Insert]}"         overwrite-mode
[[ -n "${key[Backspace]}"   ]] && bindkey -- "${key[Backspace]}"      backward-delete-char
[[ -n "${key[Delete]}"      ]] && bindkey -- "${key[Delete]}"         delete-char
[[ -n "${key[Up]}"          ]] && bindkey -- "${key[Up]}"             up-line-or-beginning-search
[[ -n "${key[Down]}"        ]] && bindkey -- "${key[Down]}"           down-line-or-beginning-search
[[ -n "${key[Left]}"        ]] && bindkey -- "${key[Left]}"           backward-char
[[ -n "${key[Right]}"       ]] && bindkey -- "${key[Right]}"          forward-char
[[ -n "${key[PageUp]}"      ]] && bindkey -- "${key[PageUp]}"         beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"    ]] && bindkey -- "${key[PageDown]}"       end-of-buffer-or-history
bindkey "^[s" sudo-command
bindkey "^[c" swap-command
bindkey "^N" menu-complete
bindkey "^P" reverse-menu-complete
bindkey '^a' alias-expension
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char

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
#zprof
