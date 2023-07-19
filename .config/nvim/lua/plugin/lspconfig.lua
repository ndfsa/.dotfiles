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
        local format_exclude = { "lua_ls", "pyright", "tsserver", "emmet_ls" }
        vim.keymap.set({ "n", "x" }, "<leader>lf", function()
            local attached_clients = vim.lsp.buf_get_clients()

            if #attached_clients < 2 then
                vim.lsp.buf.format()
                return
            end

            local entries = {}
            local iter = 1
            for _, cl in ipairs(attached_clients) do
                if not vim.list_contains(format_exclude, cl.name) then
                    entries[iter] = { label = cl.name, id = cl.id }
                    iter = iter + 1
                end
            end

            if #entries < 1 then
                vim.print("[LSP] All clients are excluded for formatting")
                return
            end

            if #entries == 1 then
                vim.lsp.buf.format({ id = entries[1].id })
                return
            end

            vim.ui.select(entries, {
                prompt = "Select LSP formatter",
                format_item = function(item)
                    return item.label
                end,
            }, function(item, _)
                vim.lsp.buf.format({ id = item.id })
            end)
        end, opts("LSP format buffer", { buffer = args.buf }))
    end,
})

local servers = require("lsp-servers")
local nvim_lsp = require("lspconfig")

for name, config in pairs(servers) do
    nvim_lsp[name].setup(config)
end
