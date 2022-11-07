require('gitsigns').setup({
    on_attach = function(_)
        vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { silent = true })
    end,
})
