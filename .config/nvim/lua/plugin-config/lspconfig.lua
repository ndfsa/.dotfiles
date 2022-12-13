require('mason').setup()
require('mason-lspconfig').setup()

local opts = require('utils').opts

local on_attach = function(client, buff_num)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist, opts('LSP diagnostics loclist'))
    vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float, opts('LSP diagnostics float'))
    vim.keymap.set(
        'n',
        'gD',
        vim.lsp.buf.declaration,
        opts('Go to declaration', { buffer = buff_num })
    )
    vim.keymap.set(
        'n',
        'gd',
        vim.lsp.buf.definition,
        opts('Go to definition', { buffer = buff_num })
    )
    vim.keymap.set(
        'n',
        'gi',
        vim.lsp.buf.implementation,
        opts('Go to implementation', { buffer = buff_num })
    )
    vim.keymap.set(
        'n',
        'gr',
        vim.lsp.buf.references,
        opts('Go to references', { buffer = buff_num })
    )
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts(nil, { buffer = buff_num }))
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts(nil, { buffer = buff_num }))
    vim.keymap.set(
        'n',
        '<leader>lt',
        vim.lsp.buf.type_definition,
        opts('LSP type definition', { buffer = buff_num })
    )
    vim.keymap.set(
        'n',
        '<leader>lr',
        vim.lsp.buf.rename,
        opts('LSP rename', { buffer = buff_num })
    )
    vim.keymap.set(
        'n',
        '<leader>lc',
        vim.lsp.buf.code_action,
        opts('LSP code actions', { buffer = buff_num })
    )
    vim.keymap.set({ 'n', 'v' }, '<leader>lf', function()
        vim.lsp.buf.format({
            filter = function()
                if client.name == 'sumneko_lua' or client.name == 'pyright' then
                    return 'null-ls'
                end
                return client.name
            end,
        })
        opts('LSP format buffer', { buffer = buff_num })
    end)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local servers = {
    'clangd',
    'emmet_ls',
    'gopls',
    'html',
    'jsonls',
    'kotlin_language_server',
    'pyright',
    'rust_analyzer',
    'svelte',
    'tsserver',
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
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
