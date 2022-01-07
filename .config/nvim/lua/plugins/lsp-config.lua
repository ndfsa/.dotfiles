local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local opts = { noremap=true, silent=true }
    buf_map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_map('n', '<leader>t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    buf_map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    buf_map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_map('n', '<leader>F', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_map('v', '<leader>F', '<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
    buf_map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
end
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        'documentation',
        'detail',
        'additionalTextEdits',
    }
}
local servers = {
    "clangd",
    "cmake",
    "hls",
    "jdtls",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "svelte",
    "tsserver",
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 200,
        }
    }
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

nvim_lsp.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 200,
    }
}
