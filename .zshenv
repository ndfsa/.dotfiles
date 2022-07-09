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
export npm_config_prefix="$HOME/.local"

CUSTOM_PATHS=(
    $HOME/.local/share/coursier/bin
    $HOME/.cargo/bin
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
