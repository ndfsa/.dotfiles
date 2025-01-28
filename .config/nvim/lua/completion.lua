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
      default = { "lsp", "path", "snippets", "buffer", "markdown" },
      providers = {
        markdown = {
          name = "RenderMarkdown",
          module = "render-markdown.integ.blink",
          fallbacks = { "lsp" },
        },
      },
    },
    completion = {
      list = {
        selection = { preselect = false, auto_insert = true },
      },
    },
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },
}
