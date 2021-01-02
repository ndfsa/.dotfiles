" Load vim plug
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'joshdick/onedark.vim'

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if has('termguicolors')
  set termguicolors
endif
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }

" vimrc migration
syntax on
colorscheme onedark
set number
syntax on

filetype on
"filetype plugin on
set tabstop=4
set shiftwidth=4
set expandtab
