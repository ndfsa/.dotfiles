require('kanagawa').setup({
    keywordStyle = 'bold',
    statementStyle = 'NONE',
    variablebuiltinStyle = 'NONE',
    transparent = false,
    globalStatus = true,
    dimInactive = true,
    overrides = { HighlightedYankRegion = { link = 'Visual' } },
})
vim.cmd([[colorscheme kanagawa]])
