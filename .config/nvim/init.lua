local opt = vim.opt
local g = vim.g
opt.title = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.number = true
opt.relativenumber = true
opt.textwidth = 99
opt.signcolumn = 'yes'
opt.cursorline = true
opt.swapfile = false
opt.undofile = true
opt.hidden = true
opt.encoding = 'UTF-8'
opt.scrolloff = 8
opt.laststatus = 2
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.shortmess:append({c = true})
opt.updatetime = 500
opt.guifont = 'JetBrains Mono:h14'
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 99
opt.fileformats = {'unix', 'dos', 'mac'}
opt.showmode = false
opt.autowrite = true
opt.mouse = 'a'
opt.pumheight = 20
opt.termguicolors = true
opt.fillchars:append({fold = ' ', eob = ' '})
opt.conceallevel = 2

g.did_load_filetypes = 1
g.loaded_matchparen = 1
g.loaded_netrwPlugin = 1
g.loaded_netrw = 1
g.Hexokinase_highlighters = {'backgroundfull'}

require('plugins').init()

g.mapleader = ' '
require('keymap').init()

vim.cmd[[
augroup convinient
    autocmd!
    autocmd FileType * autocmd BufWritePre <buffer> %s/\s\+$//e
    autocmd TextYankPost * silent!
                \ lua vim.highlight.on_yank({higroup="HighlightedYankRegion", timeout=250})
augroup END

colorscheme gruvbox
hi! Normal ctermbg=none guibg=none
highlight! link HighlightedyankRegion Visual
]]
