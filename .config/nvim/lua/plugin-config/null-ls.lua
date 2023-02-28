local null = require('null-ls')
null.setup({
    sources = {
        null.builtins.formatting.black,
        null.builtins.hover.dictionary,
    },
    on_attach = function(_, buff_num)
        local opts = require('utils').opts
        local ft = vim.bo.filetype
        if ft == 'markdown' or ft == 'txt' then
            vim.keymap.set(
                'n',
                'K',
                vim.lsp.buf.hover,
                opts('Show definition', { buffer = buff_num })
            )
        end
    end,
})
