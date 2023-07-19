local null = require("null-ls")
null.setup({
    sources = {
        null.builtins.hover.dictionary,
        null.builtins.formatting.black,
        null.builtins.formatting.stylua,
        null.builtins.formatting.prettier,
        null.builtins.formatting.sqlfluff.with({
            extra_args = { "--dialect", "postgres" },
        }),
    },
    on_attach = function(_, buff_num)
        local opts = require("utils").opts
        local ft = vim.bo.filetype
        if ft == "markdown" or ft == "txt" then
            vim.keymap.set(
                "n",
                "K",
                vim.lsp.buf.hover,
                opts("Show definition", { buffer = buff_num })
            )
        end
    end,
})
