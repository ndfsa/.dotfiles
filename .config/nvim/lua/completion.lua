return {
  "saghen/blink.cmp",
  lazy = false,
  dependencies = "rafamadriz/friendly-snippets",
  version = "v0.*",
  opts = {
    keymap = {
      preset = "enter",
      ["<Up>"] = {},
      ["<Down>"] = {},
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    completion = {
      list = {
        selection = "auto_insert",
      },
    },
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },
}
