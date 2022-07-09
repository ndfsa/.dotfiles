# profiling for performance
#zmodload zsh/zprof

### Misc Options
source ~/.config/zsh/opts.zsh

### Completion
source ~/.config/zsh/completion.zsh
fpath=(/usr/share/zsh/site-functions $fpath)

### Alias
source ~/.config/zsh/alias.zsh

### Functions
source ~/.config/zsh/functions.zsh

### Keymap
source ~/.config/zsh/keymap.zsh

### Programs
eval "$(zoxide init --no-aliases zsh)"

if [ $TERM != "linux" ]; then
    eval "$(starship init zsh)"
else
    source ~/.config/zsh/prompt.zsh
fi

### Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# profiling end
#zprof
