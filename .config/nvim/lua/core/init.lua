vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.incsearch = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.colorcolumn = "100"
vim.opt.cursorline = true
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.hidden = true
vim.opt.encoding = "UTF-8"
vim.opt.scrolloff = 5
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.shortmess:append({ c = true })
vim.opt.updatetime = 500
vim.opt.guifont = "JetBrains Mono:h15"
vim.opt.fileformats = { "unix", "dos", "mac" }
vim.opt.showmode = false
vim.opt.autoread = true
vim.opt.mouse = "a"
vim.opt.pumheight = 30
vim.opt.fillchars:append({ fold = " ", eob = " " })
vim.opt.conceallevel = 2
vim.opt.termguicolors = true
vim.opt.foldlevelstart = 99
vim.opt.listchars = {
  tab = "»-",
  extends = "⟩",
  precedes = "⟨",
  space = "·",
  nbsp = "␣",
  eol = "↲",
}

vim.opt.background = "dark"
vim.opt.spelloptions = "noplainbuffer,camel"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- EXPERIMENTAL FEATURES
-- vim.opt.cmdheight = 0
vim.opt.diffopt = { "internal", "filler", "foldcolumn:0", "linematch:80" }

local default_plugins = {
  "2html_plugin",
  "bugreport",
  "compiler",
  "ftplugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "matchparen",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "optwin",
  "rplugin",
  "rrhelper",
  "spellfile_plugin",
  "synmenu",
  "syntax",
  "tar",
  "tarPlugin",
  "tutor",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(default_plugins) do
  vim.g["loaded_" .. plugin] = 1
end

local default_providers = {
  "node",
  "perl",
  "python3",
  "ruby",
}

for _, provider in ipairs(default_providers) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.g.sql_type_default = "postgresql"

vim.g.mapleader = " "

vim.g.markdown_syntax_conceal = 0

local opts = require("utils").opts
local key = require("utils").key

key("n", "n", "nzz", opts())
key("n", "N", "Nzz", opts())

key({ "n", "v" }, "k", [[v:count == 0 ? 'gk' : 'k']], opts(nil, { expr = true }))
key({ "n", "v" }, "j", [[v:count == 0 ? 'gj' : 'j']], opts(nil, { expr = true }))

key("v", ">", ">gv", opts())
key("v", "<", "<gv", opts())

key("i", ",", ",<C-g>u", opts())
key("i", ".", ".<C-g>u", opts())
key("i", "!", "!<C-g>u", opts())
key("i", "?", "?<C-g>u", opts())
key("i", "-", "-<C-g>u", opts())
key("i", "_", "_<C-g>u", opts())

key("n", "<A-j>", ":m .+1<CR>", opts())
key("n", "<A-k>", ":m .-2<CR>", opts())
key("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts())
key("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts())
key("v", "<A-j>", ":m '>+1<CR>gv=gv", opts())
key("v", "<A-k>", ":m '<-2<CR>gv=gv", opts())

key("i", "<C-h>", "<C-w>", opts())
key("n", "<C-CR>", "i<cr><esc>", opts())

key("n", "<leader>bd", "<cmd>bd<CR>", opts("Buffer delete"))

key("n", "<leader>sn", "<cmd>set relativenumber!<CR>", opts("Set relative numbers"))
key("n", "<leader>sw", "<cmd>set wrap!<CR>", opts("Set wrap"))
key("n", "<leader>ss", "<cmd>set spell!<CR>", opts("Set spell"))
key("n", "<leader>sh", "<cmd>set list!<CR>", opts("Set listchars"))
key("n", "<leader>sb", "<cmd>set linebreak!<CR>", opts("Set line break"))

key("n", "<leader>fs", "<cmd>update<CR>", opts("File save"))
key("n", "<leader>fy", '<cmd>let @+=expand("%:p")<CR>', opts("File copy path"))

key("n", "<leader>oe", "<cmd>Oil %:p:h<CR>", opts("Open File Explorer"))
