return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      zsh = { "shfmt" },
      lua = { "stylua" },
      python = { "black" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
    },
  },
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format({
          lsp_fallback = true,
        })
      end,
      desc = "Format buffer",
      mode = "n",
    },
    {
      "<leader>lf",
      function()
        require("conform").format({
          lsp_fallback = true,
        })
      end,
      desc = "Format region",
      mode = "v",
    },
  },
}
