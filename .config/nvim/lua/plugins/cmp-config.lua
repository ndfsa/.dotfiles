local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup {
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<Tab>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable() then
				luasnip.jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {'i', 's'}),
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	}
}
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

cmp.setup.cmdline(':', {
	sources = cmp.config.sources(
		{{ name = 'path' }},
		{{ name = 'cmdline' }}
	)
})
