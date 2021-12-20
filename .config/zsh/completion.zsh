autoload -U compinit && compinit

zstyle ':completion:*' menu select=1
zstyle ':completion:*' matcher-list \
    'm:{a-z}={A-Z}' \
    'r:|[._-]=* r:|=*' \
    'l:|=* r:|=*'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' file-list all
zstyle ':completion:*' complete-options true
zstyle ':completion:alias-expension:*' completer _expand_alias
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

setopt menu_complete
