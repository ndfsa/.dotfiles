local opt = vim.opt
local g = vim.g
opt.title = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = false
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.number = true
opt.relativenumber = true
opt.colorcolumn = '100'
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
opt.guifont = "FiraCode:h14"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
opt.fileformats = {'unix', 'dos', 'mac'}
opt.showmode = false
opt.autowrite = true
opt.mouse = 'a'
opt.pumheight = 20
opt.termguicolors = true
opt.fillchars:append({fold = ' ', eob = ' '})
opt.foldtext = "FoldText()"

g.loaded_netrwPlugin = 1
g.loaded_netrw = 1

local fn = vim.fn
local plugins = require('plugins')
local bootstraped = nil
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	bootstraped = plugins.bootstrap(install_path)
end

plugins.init(bootstraped)

g.mapleader = ' '
require('keybinds')

vim.cmd[[
hi! Normal ctermbg=none guibg=none
highlight! link HighlightedyankRegion Visual
augroup convinient
	autocmd!
	autocmd FileType * autocmd BufWritePre <buffer> %s/\s\+$//e
	autocmd TextYankPost * silent!
				\ lua vim.highlight.on_yank({higroup="HighlightedYankRegion", timeout=250})
augroup END

function! FoldText()
	let line = getline(v:foldstart)
	let folded_line_num = v:foldend - v:foldstart + 1
	return '+' . repeat('-', (94 - len(folded_line_num . ''))) . '(' . folded_line_num . ' L)'
endfunction
]]
