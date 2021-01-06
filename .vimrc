syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap
set smartcase
set incsearch
set number relativenumber
set colorcolumn=80
" Load vim plug
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wfxr/minimap.vim'

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
      \              [ 'fileformat', 'fileencoding', 'filetype',
      \                         'charvaluehex' ] ],
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

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" set some basic color settings and tabs
colorscheme onedark
set laststatus=2
" Layout config for fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS = '--reverse'
" Useful keymaps
let mapleader = " "
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>no :Vex<CR>
nnoremap <silent><leader>sh :split<CR>
nnoremap <silent><leader>sv :vsplit<CR>
nnoremap <silent><C-p> :Rg<CR>
nnoremap <silent><leader>gf :GFiles<CR>
