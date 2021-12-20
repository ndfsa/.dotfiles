# profiling for performance
#zmodload zsh/zprof

### Misc Options
source ~/.config/zsh/opts.zsh

### Enable history and history cache, move to cache file in home
source ~/.config/zsh/history.zsh

### Completion
source ~/.config/zsh/completion.zsh
fpath=(/usr/share/zsh/site-functions $fpath)

### Window title
source ~/.config/zsh/title.zsh

### Alias
source ~/.config/zsh/alias.zsh

### Functions
source ~/.config/zsh/functions.zsh

### autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

### Keybinds
source ~/.config/zsh/keybinds.zsh

### Programs
eval "$(zoxide init zsh)"

if [ $TERM != "linux" ]; then
	eval "$(starship init zsh)"
else
	source ~/.config/zsh/prompt.zsh
fi

### Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# profiling end
#zprof
