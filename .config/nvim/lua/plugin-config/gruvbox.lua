M = {}

function M.pre()
    vim.opt.termguicolors = true
    vim.g.gruvbox_improved_warnings = 1
end

function M.setup()
    vim.cmd('colorscheme gruvbox')
    vim.cmd('hi! Normal ctermbg=none guibg=none')
    vim.cmd('hi! VertSplit ctermbg=none guibg=none')
    vim.cmd('hi! link HighlightedyankRegion Visual')
end

return M
