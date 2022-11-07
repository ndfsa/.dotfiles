vim.g.indent_blankline_enabled = false
require('indent_blankline').setup({
    char = '│',
    buftype_exclude = { 'terminal' },
})

vim.keymap.set('n', '<leader>sl', '<cmd>IndentBlanklineToggle<CR>', { silent = true })
