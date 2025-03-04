# set env variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_BIN_HOME="$HOME/.local/bin"
export EDITOR=nvim
export VISUAL=nvim
export BAT_THEME=base16
export PAGER=bat
export BROWSER=chromium
export LS_COLORS='di=1;34:ln=36:so=1;31:pi=33:ex=1;32:bd=1;33:cd=1;33:su=30;41:sg=30;46:tw=30;42:ow=30;43'
export MANROFFOPT='-c'
export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
export SXHKD_SHELL=dash
export JDTLS_HOME=/usr/share/java/jdtls
export AUR_PAGER=lf
export FZF_DEFAULT_OPTS='--color=16'
export DIFFPROG='nvim -d'
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/docker.sock"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export PARALLEL_HOME="$XDG_CONFIG_HOME/parallel"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export LESSHISTFILE="$XDG_CACHE_HOME/less/history"
export GHCUP_USE_XDG_DIRS=1

# create CUSTOM_PATHS array
CUSTOM_PATHS=($XDG_BIN_HOME)
CUSTOM_PATHS+=("$HOME/.dotfiles/bin")

# optionally add programs' directories to PATH if their commands are available
if command -v go &>/dev/null; then
    CUSTOM_PATHS+=("$(go env GOPATH)/bin")
fi
if command -v cargo &>/dev/null; then
    CUSTOM_PATHS+=("$CARGO_HOME/bin")
fi
if command -v npm &>/dev/null; then
    CUSTOM_PATHS+=("$XDG_DATA_HOME/npm/bin")
fi
if command -v dotnet &>/dev/null; then
    CUSTOM_PATHS+=("$HOME/.dotnet/tools")
fi

# merge PATH and CUSTOM_PATHS
for i in ${CUSTOM_PATHS[@]}; do
    case ":$PATH:" in
    *:$i:*) ;;
    *) PATH="$i:$PATH" ;;
    esac
done
unset CUSTOM_PATHS

# history options
export HISTFILE=${XDG_CACHE_HOME}/bash/history
export HISTFILESIZE=10000
export HISTSIZE=10000
export HISTCONTROL="erasedups:ignoreboth"
shopt -s histappend

# # exit if not an interactive shell
[[ $- != *i* ]] && return
# change directory and run neovim
function __scoped_edit() {
    (cd "$1" && nvim .)
}

# setup aliases
function rm() {
    trash $@
}

# set icons
[[ $TERM != "linux" ]] && icons="--icons=always"
alias ls="eza $icons --sort=type --classify=always --group"
unset icons

alias la='ls -a'
alias lsl='ls -l'
alias lal='lsl -a'
alias ip='ip --color=auto'
function mkcd() {
    mkdir $1 && cd $1
}
alias conf='__scoped_edit $HOME/.dotfiles/'
alias :q='exit' # I'm done with this

# integrate fzy
if command -v fzy &>/dev/null; then
    function fzy_history() {
        local selected
        selected=$(HISTTIMEFORMAT= history |
            tac |
            sed 's/^ *[0-9]*\** *//' |
            awk '!a[$0]++' |
            fzy --prompt "History > " --query "$READLINE_LINE")
        if [[ -n "$selected" ]]; then
            READLINE_LINE="$selected"
            READLINE_POINT=${#READLINE_LINE}
        fi
    }

    bind -x '"\C-r": fzy_history'

    function insert_path() {
        local selected_path
        selected_path=$(rg . --files --hidden 2>/dev/null | fzy --prompt "Files > ") || return
        if [[ -n "$selected_path" ]]; then
            READLINE_LINE="$READLINE_LINE$selected_path"
            READLINE_POINT=${#READLINE_LINE}
        fi
    }

    bind -x '"\C-f": insert_path'
fi

# use starship prompt
if command -v starship &>/dev/null; then
    [[ $TERM = "linux" ]] && export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship-ascii.toml
    eval "$(starship init bash)"
fi

# use zoxide
if command -v zoxide &>/dev/null; then
    # turn off completions for now
    eval "$(zoxide init bash --cmd cd)"
fi
