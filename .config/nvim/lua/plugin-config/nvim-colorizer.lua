require('colorizer').setup({
    filetypes = { },
    user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        AARRGGBB = false,
        rgb_fn = false,
        hsl_fn = false,
        css = false,
        css_fn = false,
        mode = 'background',
        virtualtext = '■',
    },
    buftypes = {},
})

vim.keymap.set('n', '<leader>sc', '<cmd>ColorizerToggle<cr>', { silent = true })
