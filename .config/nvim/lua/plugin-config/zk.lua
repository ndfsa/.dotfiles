require('zk').setup({
    picker = 'telescope',
})

vim.keymap.set('n', '<leader>on', '<cmd>ZkNotes<CR>', { remap = false, silent = true })
