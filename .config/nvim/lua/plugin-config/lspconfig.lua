local opts = require("utils").opts

local on_attach = function(client, buff_num)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts("Next diagnostic"))
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts("Next diagnostic"))
    vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts("LSP diagnostics loclist"))
    vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, opts("LSP diagnostics float"))
    vim.keymap.set(
        "n",
        "gD",
        vim.lsp.buf.declaration,
        opts("Go to declaration", { buffer = buff_num })
    )
    vim.keymap.set(
        "n",
        "gd",
        vim.lsp.buf.definition,
        opts("Go to definition", { buffer = buff_num })
    )
    vim.keymap.set(
        "n",
        "gi",
        vim.lsp.buf.implementation,
        opts("Go to implementation", { buffer = buff_num })
    )
    vim.keymap.set(
        "n",
        "gr",
        vim.lsp.buf.references,
        opts("Go to references", { buffer = buff_num })
    )
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts(nil, { buffer = buff_num }))
    vim.keymap.set(
        { "n", "i" },
        "<C-k>",
        vim.lsp.buf.signature_help,
        opts(nil, { buffer = buff_num })
    )
    vim.keymap.set(
        "n",
        "<leader>lt",
        vim.lsp.buf.type_definition,
        opts("LSP type definition", { buffer = buff_num })
    )
    vim.keymap.set(
        "n",
        "<leader>lr",
        vim.lsp.buf.rename,
        opts("LSP rename", { buffer = buff_num })
    )
    vim.keymap.set(
        { "n", "v" },
        "<leader>lc",
        vim.lsp.buf.code_action,
        opts("LSP code actions", { buffer = buff_num })
    )
    local format_exclude = { "lua_ls", "pyright", "tsserver", "emmet_ls" }
    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
        local attached_clients = vim.lsp.buf_get_clients()

        if #attached_clients <= 1 then
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

        if #entries == 0 then
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
    end, opts("LSP format buffer", { buffer = buff_num }))

    client.server_capabilities.semanticTokensProvider = nil
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    "clangd",
    "dartls",
    "emmet_ls",
    "gopls",
    "html",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "svelte",
    "tsserver",
}

local nvim_lsp = require("lspconfig")
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.lua_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
nvim_lsp.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
        },
    },
})
