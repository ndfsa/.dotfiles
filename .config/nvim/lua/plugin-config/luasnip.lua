require('luasnip/loaders/from_vscode').lazy_load({
    paths = { '~/.local/share/nvim/site/pack/packer/start/friendly-snippets' },
})

local luasnip = require('luasnip')

-- thank you TJ https://github.com/tjdevries
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-j>', function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })
