local cmp = require('cmp')
local luasnip = require('luasnip')
local lspkind = require('lspkind')
cmp.setup({
    window = {
        documentation = cmp.config.window.bordered(),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<tab>'] = cmp.config.disable,
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            mode = 'symbol_text',
        }),
    },
})
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})
