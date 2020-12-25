# Enable colors and change prompt
autoload -U colors && colors
PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f%F{yellow}${vcs_info_msg_0_}%f%(!.#.$) '
RPROMPT='[%F{yellow}%?%f]'

# Enable history and history cache, move to cache file in home
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.cache/zsh/history
HISTCONTROL=ignoreboth

# Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors \ 
       ${(s.:.)LS_COLORS}
zmodload zsh/complist
setopt menu_complete

# Git tab completition
autoload -Uz compinit && compinit
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:*' formats ' (%s-%b)'

# Enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Useful keybinds
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
