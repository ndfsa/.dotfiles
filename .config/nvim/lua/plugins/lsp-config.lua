local nvim_lsp = require('lspconfig')
local on_attach = function(_, bufnr)
    local opts = { noremap=true, silent=true }
    local function buf_map(mode, lhs, rhs)
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
    end

    buf_map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
    buf_map('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>')
    buf_map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
    buf_map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
    buf_map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
    buf_map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
    buf_map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
    buf_map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

    buf_map('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
    buf_map('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<CR>')
    buf_map('n', '<leader>lc', '<cmd>lua vim.lsp.buf.code_action()<CR>')
    buf_map('n', '<leader>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>')
    buf_map('n', '<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
    buf_map('n', '<leader>le', '<cmd>lua vim.diagnostic.open_float()<CR>')
    buf_map('v', '<leader>lf', '<cmd>lua vim.lsp.buf.range_formatting()<CR>')
    buf_map('v', '<leader>lc', '<cmd>lua vim.lsp.buf.range_code_action()<CR>')
end
local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)
capabilities.textDocument.completion.completionItem.snippetSupport = false
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
    "tsserver",
    "zls",
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
}
