local opts = require("utils").opts

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Next diagnostic"))
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts("LSP diagnostics loclist"))
vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, opts("LSP diagnostics float"))

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(args)
        vim.keymap.set(
            "n",
            "gD",
            vim.lsp.buf.declaration,
            opts("Go to declaration", { buffer = args.buf })
        )
        vim.keymap.set(
            "n",
            "gd",
            vim.lsp.buf.definition,
            opts("Go to definition", { buffer = args.buf })
        )
        vim.keymap.set(
            "n",
            "gi",
            vim.lsp.buf.implementation,
            opts("Go to implementation", { buffer = args.buf })
        )
        vim.keymap.set(
            "n",
            "gr",
            vim.lsp.buf.references,
            opts("Go to references", { buffer = args.buf })
        )
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts(nil, { buffer = args.buf }))
        vim.keymap.set(
            { "n", "i" },
            "<C-k>",
            vim.lsp.buf.signature_help,
            opts(nil, { buffer = args.buf })
        )
        vim.keymap.set(
            "n",
            "<leader>lt",
            vim.lsp.buf.type_definition,
            opts("LSP type definition", { buffer = args.buf })
        )
        vim.keymap.set(
            "n",
            "<leader>lr",
            vim.lsp.buf.rename,
            opts("LSP rename", { buffer = args.buf })
        )
        vim.keymap.set(
            { "n", "v" },
            "<leader>lc",
            vim.lsp.buf.code_action,
            opts("LSP code actions", { buffer = args.buf })
        )
    end,
})

local servers = require("lsp-servers")
local nvim_lsp = require("lspconfig")

for name, config in pairs(servers) do
    nvim_lsp[name].setup(config)
end
