# colors
autoload -U colors && colors
export EDITOR=VIM;

### Enable history and history cache, move to cache file in home
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
HISTCONTROL=ignoreboth
setopt hist_ignore_dups     # ignore dups in history
# Enable history search with up and down command
#autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
#zle -N up-line-or-beginning-search
#zle -N down-line-or-beginning-search

#[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
#[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search


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
zstyle ':vcs_info:*' stagedstr '%F{green}*%f' 
zstyle ':vcs_info:*' unstagedstr '%F{yellow}*%f'
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' formats ' %F{magenta}(%b%f%c%u%F{magenta})%f'


### Fancy prompt
case ${TERM} in
    xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
        PROMPT='%F{blue}%n%f@%m %F{yellow}%~%f${vcs_info_msg_0_}%F{green}>%f '
        RPROMPT='[%F{yellow}%?%f]'
        ;;
    *)
        PROMPT='%F{green}%n@%m%f:%~%(!.#.$) '
        ;;
esac
##########################
### Handle window name ###
##########################
# NOTE: I took this implementation from https://github.com/ohmyzsh/ohmyzsh
#       and trimmed down the things I did not need.
function title {
    emulate -L zsh
    setopt prompt_subst

    # if $2 is unset use $1 as default
    # if it is set and empty, leave it as is
    : ${2=$1}

    case "$TERM" in
        cygwin|xterm*|putty*|rxvt*|konsole*|ansi|mlterm*|alacritty|st*)
            print -Pn "\e]2;${2:q}\a" # set window name
            print -Pn "\e]1;${1:q}\a" # set tab name
            ;;
        screen*|tmux*)
            print -Pn "\ek${1:q}\e\\" # set screen hardstatus
            ;;
        *)
            # Try to use terminfo to set the title
            # If the feature is available set title
            if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
                echoti tsl
                print -Pn "$1"
                echoti fsl
            fi
            ;;
    esac
}
tab_title="%15<..<%~%<<" #15 char left truncated PWD
win_title="%n@%m:%~"
function precmd(){
    title $tab_title $win_title
}
function preexec(){ 
    emulate -L zsh
    setopt extended_glob

    # split command into array of arguments
    local -a cmdargs
    cmdargs=("${(z)2}")
    # if running fg, extract the command from the job description
    if [[ "${cmdargs[1]}" = fg ]]; then
        # get the job id from the first argument passed to the fg command
        local job_id jobspec="${cmdargs[2]#%}"
        # logic based on jobs arguments:
        # http://zsh.sourceforge.net/Doc/Release/Jobs-_0026-Signals.html#Jobs
        # https://www.zsh.org/mla/users/2007/msg00704.html
        case "$jobspec" in
            <->) # %number argument:
                # use the same <number> passed as an argument
                job_id=${jobspec}
                ;;
            ""|%|+) # empty, %% or %+ argument:
                # use the current job, which appears with a + in $jobstates:
                # suspended:+:5071=suspended (tty output)
                job_id=${(k)jobstates[(r)*:+:*]}
                ;;
            -) # %- argument:
                # use the previous job, which appears with a - in $jobstates:
                # suspended:-:6493=suspended (signal)
                job_id=${(k)jobstates[(r)*:-:*]}
                ;;
            [?]*) # %?string argument:
                # use $jobtexts to match for a job whose command *contains* <string>
                job_id=${(k)jobtexts[(r)*${(Q)jobspec}*]}
                ;;
            *) # %string argument:
                # use $jobtexts to match for a job whose command *starts with* <string>
                job_id=${(k)jobtexts[(r)${(Q)jobspec}*]}
                ;;
        esac

        # override preexec function arguments with job command
        if [[ -n "${jobtexts[$job_id]}" ]]; then
            1="${jobtexts[$job_id]}"
            2="${jobtexts[$job_id]}"
        fi
    fi

    # cmd name only, or if this is sudo or ssh, the next cmd
    local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
    local LINE="${2:gs/%/%%}"

    title '$CMD' '%100>...>$LINE%<<'
}


### Enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'

### Useful keybinds
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
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

### Word styles
autoload -U select-word-style
select-word-style bash

