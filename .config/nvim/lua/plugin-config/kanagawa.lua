require('kanagawa').setup({
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = { bold = true },
    keywordStyle = { bold = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { bold = true },
    specialReturn = true,
    specialException = true,
    transparent = false,
    dimInactive = true,
    globalStatus = true,
    colors = {},
    overrides = function(_)
        return {}
    end,
})
vim.cmd('colorscheme kanagawa')
