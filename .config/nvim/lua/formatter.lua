return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
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
    },
    desc = "Format buffer",
    mode = { "n", "v" },
  },
  lazy = true,
}
