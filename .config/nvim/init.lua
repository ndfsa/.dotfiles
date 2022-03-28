local opt = vim.opt
local g = vim.g
local api = vim.api

opt.title = true
opt.wrap = false
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
opt.colorcolumn = '100'
opt.cursorline = true
opt.swapfile = false
opt.undofile = true
opt.hidden = true
opt.encoding = 'UTF-8'
opt.scrolloff = 8
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
opt.listchars = {
    tab = '»-',
    extends = '⟩',
    precedes = '⟨',
    space = '·',
    nbsp = '␣',
    eol = '↲'
}
opt.background = 'dark'

g.loaded_gzip = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1
g.loaded_2html_plugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
g.loaded_logiPat = 1
g.loaded_rrhelper = 1
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_netrwSettings = 1

g.do_filetype_lua = 1
-- g.did_load_filetypes = 0

g.Hexokinase_highlighters = {'backgroundfull'}
g.Hexokinase_ftEnabled = {}

g.gruvbox_material_enable_bold = 1
g.gruvbox_material_enable_italic = 1
g.gruvbox_material_transparent_background = 1
g.gruvbox_material_statusline_style = 'original'
g.gruvbox_material_palette = 'original'
g.gruvbox_material_better_performance = 1

require('plugins').init()

g.mapleader = ' '
require('keymap').init()

local AUG = "convenient"
api.nvim_create_augroup(AUG,{
    clear = true
})
api.nvim_create_autocmd("TextYankPost *", {
    group = AUG,
    callback = function()
        vim.highlight.on_yank({
            higroup = "HighlightedYankRegion",
            timeout = 250
        })
    end
})
api.nvim_create_autocmd("FileType *", {
    group = AUG,
    callback = function()
        api.nvim_create_autocmd("BufWritePre <buffer>", {
            group = AUG,
            command = [[:exe 'norm m`' | %s/\s\+$//ge | norm ``]]
        })
    end
})

vim.cmd('colorscheme gruvbox-material')
