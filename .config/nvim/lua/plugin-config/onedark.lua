local onedark = require('onedark')
onedark.setup({
    transparent = true,
    code_style = { keywords = 'bold', functions = 'bold' },
})
onedark.load()
vim.cmd('hi! link HighlightedyankRegion Visual')
