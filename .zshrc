# profiling for performance
#zmodload zsh/zprof

# colors
autoload -U colors && colors
export EDITOR=nvim
export PAGER=less
export BROWSER=firefox
WORDCHARS='~!#$%^&*(){}[]<>?.+;-'


### set extended globs, may conflict with valid filenames, remember to look out
setopt extended_glob


### Enable history and history cache, move to cache file in home
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
HISTCONTROL=ignoreboth
setopt hist_ignore_dups     # ignore dups in history


### Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:default' list-colors \ 
       ${(s.:.)LS_COLORS}
zmodload zsh/complist
setopt menu_complete


##############
##  PROMPT  ##
##############
setopt prompt_subst         # subject prompt to parameter expansion, command substitution and arithmetic expansion
### Git tab completition and VCS info in prompt
autoload -Uz compinit && compinit
autoload -Uz vcs_info

precmd_vcs_info() {
    # only perform if the directory in question is a git repository
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]
    then
        vcs_info
    else
        vcs_info_msg_0_=""
    fi
}
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:*' enable git   
zstyle ':vcs_info:*' stagedstr ' %F{green}%f' 
zstyle ':vcs_info:*' unstagedstr ' %F{yellow}%f'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats 'שׂ %F{magenta}(%b%f%c%u%m%F{magenta})%f '

+vi-git-untracked() {
  if git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]=' %F{red}%f'
  fi
}


### Fancy prompt
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
        PS1='%F{blue}%n%f@%m %F{yellow}%~%f%F{green}>%f '
        RPS1='${vcs_info_msg_0_}[%F{yellow}%?%f]'
        ;;
    *)
        PS1='%F{green}%n@%m%f:%~%(!.#.$) '
        ;;
esac


###################
##  WINDOW TITLE  #
###################
case $TERM in
  termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
    precmd () {
      vcs_info
      print -Pn "\e]0;[%n@%M][%~]%#\a"
    } 
    preexec () { print -Pn "\e]0;[%n@%M][%~]%# ($1)\a" }
    ;;
  screen|screen-256color)
    precmd () { 
      vcs_info
      print -Pn "\e]83;title \"$1\"\a" 
      print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a" 
    }
    preexec () { 
      print -Pn "\e]83;title \"$1\"\a" 
      print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a" 
    }
    ;; 
esac


### Enable color support of ls and also add handy aliases
alias ls='ls --color=auto --human-readable'
alias grep='grep --color=auto --human-readable'
alias vim='nvim'


### Useful keybinds
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey '^H' backward-kill-word
bindkey '5~' kill-word


### History search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down


# auto sugestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# profiling
#zprof
