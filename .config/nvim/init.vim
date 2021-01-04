" Load vim plug
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'

call plug#end()


"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if has('termguicolors')
  set termguicolors
endif
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ],
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ }


" hide another instert type
set noshowmode


" set some options for netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 2
let g:netrw_winsize = 20
let g:netrw_liststyle = 0
let g:netrw_browse_split = 2

" set some basic color settings and tabs
colorscheme onedark
syntax on

filetype on
" filetype plugin on
set tabstop=4
set shiftwidth=4
set expandtab


" Autotoggle numbers from relative to absolute when
" changing buffers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufLeave,FocusLost   * set norelativenumber
  autocmd BufEnter,FocusGained * set relativenumber
augroup END
