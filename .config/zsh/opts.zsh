export EDITOR=nvim
export PAGER=less
export BROWSER=firefox
export BAT_THEME='gruvbox-dark'
WORDCHARS='~!#$%^&*(){}[]<>?.+-'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f
  --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

### set extended globs, may conflict with valid filenames, remember to look out
setopt extended_glob