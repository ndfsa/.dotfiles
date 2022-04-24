local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('n', '<leader>lq', vim.diagnostic.setloclist, opts)
map('n', '<leader>le', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)

local on_attach = function(client, buff_num)
    local buff_opts = { noremap = true, silent = true, buffer = buff_num }

    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false

    map('n', 'gD', vim.lsp.buf.declaration, buff_opts)
    map('n', 'gd', vim.lsp.buf.definition, buff_opts)
    map('n', 'gi', vim.lsp.buf.implementation, buff_opts)
    map('n', 'gr', vim.lsp.buf.references, buff_opts)
    map('n', 'K', vim.lsp.buf.hover, buff_opts)
    map('v', 'K', vim.lsp.buf.hover, buff_opts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, buff_opts)
    map('n', '<leader>lt', vim.lsp.buf.type_definition, buff_opts)
    map('n', '<leader>lr', vim.lsp.buf.rename, buff_opts)
    map('n', '<leader>lc', vim.lsp.buf.code_action, buff_opts)
    map('v', '<leader>lc', vim.lsp.buf.range_code_action, buff_opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = {
    'clangd',
    'cmake',
    'hls',
    'jdtls',
    'jsonls',
    'pyright',
    'rust_analyzer',
    'tsserver',
    'volar',
    'zls',
}

local nvim_lsp = require('lspconfig')
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup({
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 200,
        },
    })
end

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

nvim_lsp.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 200,
    },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
