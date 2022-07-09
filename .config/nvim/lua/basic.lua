vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent= true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
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
vim.opt.fileformats = { 'unix', 'dos', 'mac' }
vim.opt.showmode = false
vim.opt.autowrite = true
vim.opt.mouse = 'a'
vim.opt.pumheight = 30
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
-- vim.opt.cmdheight = 0
vim.opt.background = 'dark'

vim.opt.winbar = '%=%n:%t%4m%5r%4w%='
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

vim.g.mapleader = ' '

local opts = { silent = true }

vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set('n', 'k', [[v:count == 0 ? 'gk' : 'k']], { expr = true, silent = true })
vim.keymap.set('n', 'j', [[v:count == 0 ? 'gj' : 'j']], { expr = true, silent = true })

vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)

vim.keymap.set('i', ',', ',<C-g>u', opts)
vim.keymap.set('i', '.', '.<C-g>u', opts)
vim.keymap.set('i', '!', '!<C-g>u', opts)
vim.keymap.set('i', '?', '?<C-g>u', opts)
vim.keymap.set('i', '-', '-<C-g>u', opts)
vim.keymap.set('i', '_', '_<C-g>u', opts)

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', opts)
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

vim.keymap.set('n', ']b', '<cmd>bn<CR>', opts)
vim.keymap.set('n', '[b', '<cmd>bp<CR>', opts)
vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>', opts)

vim.keymap.set('n', '<leader>sn', '<cmd>set relativenumber!<CR>', opts)
vim.keymap.set('n', '<leader>sw', '<cmd>set wrap!<CR>', opts)
vim.keymap.set('n', '<leader>ss', '<cmd>set spell!<CR>', opts)
vim.keymap.set('n', '<leader>sh', '<cmd>set list!<CR>', opts)
vim.keymap.set('n', '<leader>sb', '<cmd>set linebreak!<CR>', opts)

vim.keymap.set('n', '<leader>fs', '<cmd>update<CR>', opts)
vim.keymap.set('n', '<leader>fy', '<cmd>let @+=expand("%:p")<CR>', opts)

vim.keymap.set('n', '<leader>oe', '<cmd>edit %:p:h<CR>', opts)
