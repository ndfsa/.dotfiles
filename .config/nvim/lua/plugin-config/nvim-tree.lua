require('nvim-tree').setup({
    hijack_netrw = false,
    update_to_buf_dir = false,
    hijack_directories = {
        enable = false,
        auto_open = false,
    },
    view = {
        side = 'right',
        width = 40,
    },
})
vim.keymap.set('n', '<leader>ot', '<cmd>NvimTreeToggle<CR>', { remap = false, silent = true })
