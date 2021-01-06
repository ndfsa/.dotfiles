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
set encoding=UTF-8

let NERDTreeShowHidden=1
let NERDTreeWinPos="right"
let NERDTreeNaturalSort=1

" Load vim plug
call plug#begin('~/.vim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

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

" set some basic color settings and tabs
colorscheme onedark

" Layout config for fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS = '--reverse'

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
    \ exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Useful keymaps
let mapleader = " "
" switch buffers
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>
" split windows
nnoremap <silent><leader>sh :split<CR>
nnoremap <silent><leader>sv :vsplit<CR>
" fuzzy finder
nnoremap <silent><C-p> :Rg<CR>
nnoremap <silent><leader>gf :GFiles<CR>
" nerdtree replacing netrw
nnoremap <silent><C-t> :NERDTreeToggle<CR>
