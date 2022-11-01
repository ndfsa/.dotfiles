vim.keymap.set('n', '<leader>lq', vim.diagnostic.setloclist)
vim.keymap.set('n', '<leader>le', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
local on_attach = function(_, buff_num)
    local buff_opts = { silent = true, buffer = buff_num }

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, buff_opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, buff_opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, buff_opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, buff_opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, buff_opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, buff_opts)
    vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, buff_opts)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, buff_opts)
    vim.keymap.set('n', '<leader>lc', vim.lsp.buf.code_action, buff_opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

local servers = {
    'clangd',
    'cmake',
    'clojure_lsp',
    'html',
    'jdtls',
    'jsonls',
    'metals',
    'pyright',
    'svelte',
    'tsserver',
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

nvim_lsp.rust_analyzer.setup({
    on_attach = function(_, buff_num)
        on_attach(_, buff_num)
        vim.keymap.set('n', '<leader>fp', function()
            vim.lsp.buf.format({
                name = 'rust_analyzer',
            })
        end, { silent = true, buffer = buff_num })
    end,
    capabilities = capabilities,
})

nvim_lsp.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    init_options = {
        html = {
            options = {
                ['bem.enabled'] = true,
            },
        },
    },
})