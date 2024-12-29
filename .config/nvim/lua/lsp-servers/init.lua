return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  config = function()
    -- disable zig autoformat
    vim.g.zig_fmt_autosave = 0

    local servers = {}

    servers.csharp_ls = {}
    servers.emmet_language_server = {}
    servers.gopls = require("lsp-servers.gopls")
    servers.hls = require("lsp-servers.hls")
    servers.html = {}
    servers.jsonls = {}
    servers.lua_ls = require("lsp-servers.lua_ls")
    servers.nextls = require("lsp-servers.nextls")
    servers.pyright = {}
    servers.rust_analyzer = require("lsp-servers.rust_analyzer")
    servers.ts_ls = {}
    servers.zls = {}

    local on_attach = function(client, _)
      client.server_capabilities.semanticTokensProvider = nil
    end

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    for _, serv in pairs(servers) do
      serv.on_attach = on_attach
      serv.capabilities = capabilities
    end
    local opts = require("utils").opts

    vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, opts("LSP diagnostics loclist"))

    local lspgroup = vim.api.nvim_create_augroup("UserLspConfig", {})
    vim.api.nvim_create_autocmd("LspAttach", {
      group = lspgroup,
      callback = function(args)
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
      end,
    })

    local lspconfig = require("lspconfig")

    for name, config in pairs(servers) do
      lspconfig[name].setup(config)
    end
  end,
}
