local null = require('null-ls')
null.setup({
    sources = {
        null.builtins.formatting.stylua,
        null.builtins.formatting.black,
        null.builtins.formatting.clang_format,
        null.builtins.formatting.prettier,
        null.builtins.formatting.zigfmt,
        null.builtins.formatting.scalafmt,
        null.builtins.hover.dictionary,
    },
    on_attach = function(_, buff_num)
        local opts = { silent = true, buffer = buff_num }
        vim.keymap.set('n', '<leader>fp', function()
            vim.lsp.buf.format({
                name = 'null-ls',
            })
        end, opts)
        local ft = vim.bo.filetype
        if ft == 'markdown' or ft == 'txt' then
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        end
    end,
})
