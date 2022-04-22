M = {}

function M.pre()
    vim.opt.termguicolors = true
    vim.g.gruvbox_italic = 1
    vim.g.gruvbox_bold = 1
    vim.g.gruvbox_italic_comments = 1
    vim.g.gruvbox_improved_warnings = 1
end

function M.setup()
    vim.cmd('colorscheme gruvbox')
    vim.cmd('hi! Normal ctermbg=none guibg=none')
    vim.cmd('hi! VertSplit ctermbg=none guibg=none')
    vim.cmd('hi! link HighlightedyankRegion Visual')
end

return M
