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

export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export NPM_CONFIG_PREFIX="$HOME/.local"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export LEIN_HOME="$XDG_DATA_HOME"/lein
export LESSHISTFILE="$XDG_CACHE_HOME"/less/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

[ -z $(pgrep gpg-agent) ] && gpgconf --launch gpg-agent
