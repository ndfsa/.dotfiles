require('indent_blankline').setup({
    char = '│',
    buftype_exclude = { 'terminal' },
    filetype_exclude = { 'lspinfo', 'lir', 'help', 'markdown', 'packer', 'nofile', '' },
})

vim.keymap.set('n', '<leader>sl', '<cmd>IndentBlanklineToggle<CR>', { silent = true })
