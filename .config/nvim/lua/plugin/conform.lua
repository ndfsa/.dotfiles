local opts = require("utils").opts
local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        c = { "clang_format" },
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
    },
})

vim.keymap.set({ "n", "v" }, "<leader>lf", function()
    conform.format({
        lsp_fallback = true,
    })
end, opts("Format buffer"))
