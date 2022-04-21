vim.opt.title = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '100'
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.hidden = true
vim.opt.encoding = 'UTF-8'
vim.opt.scrolloff = 5
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.shortmess:append({ c = true })
vim.opt.updatetime = 500
vim.opt.guifont = 'JetBrains Mono:h14'
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
vim.opt.fileformats = { 'unix', 'dos', 'mac' }
vim.opt.showmode = false
vim.opt.autowrite = true
vim.opt.mouse = 'a'
vim.opt.pumheight = 30
vim.opt.termguicolors = true
vim.opt.fillchars:append({ fold = ' ', eob = ' ' })
vim.opt.conceallevel = 2
vim.opt.listchars = {
    tab = '»-',
    extends = '⟩',
    precedes = '⟨',
    space = '·',
    nbsp = '␣',
    eol = '↲',
}
vim.opt.background = 'dark'

vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

vim.g.gruvbox_italic = 1
vim.g.gruvbox_bold = 1
vim.g.gruvbox_italic_comments = 1
vim.g.gruvbox_improved_warnings = 1

vim.g.Hexokinase_highlighters = { 'sign_column' }
vim.g.Hexokinase_ftEnabled = {}

vim.g.undotree_SplitWidth = 40

require('plugins')

vim.g.mapleader = ' '
require('keymap')

local AUG = vim.api.nvim_create_augroup('convenient', {
    clear = true,
})
vim.api.nvim_create_autocmd('TextYankPost', {
    group = AUG,
    callback = function()
        vim.highlight.on_yank({
            higroup = 'HighlightedYankRegion',
            timeout = 250,
        })
    end,
})
vim.api.nvim_create_autocmd('BufWritePost', {
    group = AUG,
    pattern = { '*/plugins/init.lua' },
    callback = function()
        require('packer').compile()
    end,
})
vim.cmd('colorscheme gruvbox')
vim.cmd('hi! Normal ctermbg=none guibg=none')
vim.cmd('hi! link HighlightedyankRegion Visual')
vim.cmd('hi! VertSplit ctermbg=none guibg=none')
