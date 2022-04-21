local null = require('null-ls')
null.setup({
    sources = {
        null.builtins.formatting.stylua,
        null.builtins.formatting.black,
        null.builtins.formatting.clang_format,
        null.builtins.formatting.rustfmt,
        null.builtins.formatting.prettier,
        null.builtins.formatting.zigfmt,
        null.builtins.hover.dictionary,
    },
    on_attach = function()
        local ft = vim.bo.filetype
        if ft == 'markdown' or ft == 'txt' then
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { remap = false, silent = true })
        end
    end,
})
