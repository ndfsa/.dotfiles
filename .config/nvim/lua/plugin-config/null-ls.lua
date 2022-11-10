local null = require('null-ls')
null.setup({
    sources = {
        null.builtins.formatting.stylua,
        null.builtins.formatting.black,
        null.builtins.formatting.clang_format,
        null.builtins.formatting.cljstyle,
        null.builtins.formatting.prettier,
        null.builtins.formatting.stylish_haskell,
        null.builtins.formatting.zigfmt,
        null.builtins.hover.dictionary,
    },
    on_attach = function(_, buff_num)
        local opts = require('utils').opts

        vim.keymap.set('n', '<leader>lf', function()
            vim.lsp.buf.format({
                name = 'null-ls',
            })
        end, opts('Format buffer', { buffer = buff_num }))
        local ft = vim.bo.filetype
        if ft == 'markdown' or ft == 'txt' then
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts(nil, { buffer = buff_num }))
        end
    end,
})
