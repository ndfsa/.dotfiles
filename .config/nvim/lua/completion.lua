return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind-nvim",
  },
  priority = 1000,
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      enabled = function()
        local disabled = false
        disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
        disabled = disabled or (vim.fn.reg_recording() ~= "")
        disabled = disabled or (vim.fn.reg_executing() ~= "")

        local context = require("cmp.config.context")
        local cmd_mode = vim.api.nvim_get_mode().mode == "c"
        disabled = disabled or (not cmd_mode and context.in_treesitter_capture("comment"))
        disabled = disabled or (not cmd_mode and context.in_syntax_group("Comment"))
        return not disabled
      end,
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      preselect = cmp.PreselectMode.None,
      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm(),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<tab>"] = cmp.config.disable,
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "path" },
        { name = "buffer" },
      }, {
        { name = "nvim_lua" },
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          maxwidth = 50,
          mode = "symbol_text",
          menu = {
            buffer = "[Buff]",
            path = "[Path]",
            nvim_lsp = "[Lsp]",
            luasnip = "[Snip]",
          },
        }),
      },
    })
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })
  end,
}
