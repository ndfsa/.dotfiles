require("kanagawa").setup({
    compile = true,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = { bold = true },
    keywordStyle = { bold = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    globalStatus = true,
    colors = {
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(_)
        return {}
    end,
    theme = "wave",
    background = {
        dark = "wave",
        light = "lotus",
    },
})
vim.cmd("colorscheme kanagawa")