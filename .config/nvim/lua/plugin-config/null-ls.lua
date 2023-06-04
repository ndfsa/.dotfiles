local null = require("null-ls")
null.setup({
    sources = {
        null.builtins.formatting.black,
        null.builtins.hover.dictionary,
        null.builtins.formatting.stylua,
    },
    on_attach = function(_, buff_num)
        local opts = require("utils").opts
        local ft = vim.bo.filetype
        if ft == "python" or ft == "lua" then
            vim.keymap.set(
                { "n", "v" },
                "<leader>lf",
                vim.lsp.buf.format,
                opts("LSP format buffer", { buffer = buff_num })
            )
        end
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
