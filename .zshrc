# colors
autoload -U colors && colors
export EDITOR=VIM;

### Enable history and history cache, move to cache file in home
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.cache/zsh/history
HISTCONTROL=ignoreboth
setopt hist_ignore_dups     # ignore dups in history
# Enable history search with up and down command
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search


### Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*'  matcher-list 'm:{a-z}={A-Z}'	# tab completition is case insensitive
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
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
zstyle ':vcs_info:*' stagedstr ' %F{green}●%f' 
zstyle ':vcs_info:*' unstagedstr ' %F{yellow}●%f'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' %F{magenta}( %b%f%c%u %F{magenta})%f '


### Enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'


### Useful keybinds
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char
bindkey '^H' backward-kill-word
bindkey '5~' kill-word


### Word styles
autoload -U select-word-style
select-word-style bash


### Fancy prompt
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
        PROMPT='%B%F{blue}[%f%F{yellow}%~%f%F{blue}]%f%b${vcs_info_msg_0_}%F{green}->%f '
        RPROMPT='[%F{yellow}%?%f]'
        ;;
    *)
        PROMPT='%F{green}%n@%m%f:%~%(!.#.$)'
        ;;
esac

### Handle window name
precmd(){
    case ${TERM} in
        xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
            print -Pn "\e]2;"
            [[ ! -z "$1" ]] && print -Rn "$(echo $1 | awk '{print $1}') ";
            print -Pn "%/\a"
            ;;
    esac
}
preexec(){ precmd "$1" }
