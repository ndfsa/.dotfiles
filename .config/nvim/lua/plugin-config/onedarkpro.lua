local onedarkpro = require('onedarkpro')
onedarkpro.setup({
    options = {
        bold = true,
        italic = false,
        underline = false,
        undercurl = true,
        cursorline = true,
        transparency = true,
        terminal_colors = false,
    },
    styles = {
        comments = 'italic',
        functions = 'bold',
        keywords = 'bold',
        strings = 'NONE',
        variables = 'NONE',
        virtual_text = 'NONE',
    },
})
onedarkpro.load('onedark')
vim.cmd('hi! link HighlightedyankRegion Visual')
