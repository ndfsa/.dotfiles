set title
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set autoindent
set ignorecase smartcase
set incsearch
set nohlsearch
set nu rnu
set colorcolumn=100
set textwidth=99
set nowrap
set signcolumn=yes
set cursorline
set noswapfile
set undofile
set hidden
set encoding=UTF-8
set laststatus=2
set scrolloff=8
set undofile
set laststatus=2
set completeopt=menu,menuone,noselect
set shortmess+=c
set updatetime=500
set guifont=FiraCode:h14
set foldmethod=indent
set nofoldenable
set fileformats=unix,dos,mac
set noshowmode
set autowrite
set mouse=a
set pumheight=15

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

let g:gitblame_enabled = 0

lua require('plugins')

let g:user_emmet_mode = 'n'
let g:user_emmet_install_global = 0

set termguicolors
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_palette = 'original'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_better_performance = 1
augroup colorscheme_custom
	autocmd!
	autocmd ColorScheme * highlight WhichKeyFloat guibg=none
augroup END
colorscheme gruvbox-material

" Remove all trailing spaces
augroup convinient
	autocmd!
	autocmd FileType * autocmd BufWritePre <buffer> %s/\s\+$//e
	autocmd TextYankPost * silent!
				\ lua vim.highlight.on_yank({higroup="HighlightedYankRegion", timeout=200})
augroup END

function! FoldText()
	let line = getline(v:foldstart)
	let folded_line_num = v:foldend - v:foldstart + 1
	return '+' . repeat('-', (94 - len(folded_line_num . ''))) . '(' . folded_line_num . ' L)'
endfunction
set fillchars=fold:\ ,eob:\ ,
set foldtext=FoldText()

" useful keymaps
let mapleader = ' '

" center search
nnoremap n nzzzv
nnoremap N Nzzzv

vnoremap > >gv
vnoremap < <gv

" undo break points
inoremap , ,<C-g>u
inoremap . .<C-g>u
inoremap ! !<C-g>u
inoremap ? ?<C-g>u
inoremap - -<C-g>u
inoremap _ _<C-g>u

" buffer operations
nnoremap <silent><leader>bp :bprevious<CR>
nnoremap <silent><leader>bn :bnext<CR>
nnoremap <silent><leader>bf :Telescope buffers<CR>
nnoremap <silent><leader>bd :bd<CR>

" move lines
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

" toggle options
nnoremap <leader>sn :set relativenumber!<CR>
nnoremap <leader>sh :set hlsearch!<CR>
nnoremap <leader>sw :set wrap!<CR>
nnoremap <leader>ss :set spell!<CR>
nnoremap <leader>sc :ColorizerToggle<CR>
nnoremap <leader>sl :IndentBlanklineToggle<CR>
nnoremap <leader>sb :Gitsigns toggle_current_line_blame<CR>

" file
nnoremap <silent><leader>fs :update<CR>
nnoremap <silent><leader>ff :Telescope find_files<CR>
nnoremap <silent><leader>fg :Telescope live_grep<CR>
nnoremap <silent><leader>fz :Telescope current_buffer_fuzzy_find<CR>

" open
nnoremap <silent><leader>up <cmd>lua require('telescope').extensions.project.project{}<CR>
nnoremap <silent><leader>ue :lua require('lir.float').toggle()<CR>
nnoremap <silent><leader>um :Telescope marks<CR>

" git
nnoremap <silent><leader>gb :Telescope git_branches<CR>
nnoremap <silent><leader>gs :Neogit<CR>
nnoremap <silent><leader>gw <cmd>lua require"gitsigns".blame_line{full=true}<CR>

" vim maximizer
nnoremap <silent><F3> :MaximizerToggle<CR>
vnoremap <silent><F3> :MaximizerToggle<CR>gv
inoremap <silent><F3> <C-o>:MaximizerToggle<CR>
