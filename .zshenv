# XDG spec
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

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

CUSTOM_PATHS=(
    $CARGO_HOME/bin
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
