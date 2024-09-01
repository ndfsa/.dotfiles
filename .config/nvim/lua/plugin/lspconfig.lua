return function()
    local opts = require("utils").opts

    vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts("LSP diagnostics loclist"))

    local lspgroup = vim.api.nvim_create_augroup("UserLspConfig", {})
    vim.api.nvim_create_autocmd("LspAttach", {
        group = lspgroup,
        callback = function(args)
            -- vim.bo[args.buf].omnifunc = nil
            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)

            local buf_opts = function(desc)
                return opts(desc, { buffer = bufnr })
            end
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, buf_opts("Go to declaration"))
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, buf_opts("Go to definition"))
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, buf_opts("Go to implementation"))
            vim.keymap.set("n", "gr", vim.lsp.buf.references, buf_opts("Go to references"))
            vim.keymap.set(
                { "n", "i" },
                "<C-k>",
                vim.lsp.buf.signature_help,
                buf_opts("Show signature help")
            )
            vim.keymap.set(
                "n",
                "<leader>lt",
                vim.lsp.buf.type_definition,
                buf_opts("LSP type definition")
            )
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, buf_opts("LSP rename"))
            vim.keymap.set(
                { "n", "v" },
                "<leader>lc",
                vim.lsp.buf.code_action,
                buf_opts("LSP code actions")
            )

            if client == nil then
                return
            end
            if client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
                vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                    buffer = bufnr,
                    group = lspgroup,
                    callback = function()
                        vim.lsp.buf.document_highlight()
                    end,
                })
                vim.api.nvim_create_autocmd({ "CursorMoved" }, {
                    buffer = bufnr,
                    group = lspgroup,
                    callback = function()
                        vim.lsp.buf.clear_references()
                    end,
                })
            end
            -- if client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            --     vim.lsp.inlay_hint.enable()
            -- end
        end,
    })

    local servers = require("lsp-servers")
    local lspconfig = require("lspconfig")

    for name, config in pairs(servers) do
        lspconfig[name].setup(config)
    end
end
