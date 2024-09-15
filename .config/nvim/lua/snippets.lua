return {
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  dependencies = { "honza/vim-snippets" },
  config = function()
    require("luasnip.loaders.from_snipmate").lazy_load()
  end,
  keys = {
    {
      "<C-L>",
      function()
        require("luasnip").jump(1)
      end,
      desc = "Snippet jump forward",
      mode = { "i", "s" },
    },
    {
      "<C-j>",
      function()
        require("luasnip").jump(-1)
      end,
      desc = "Snippet jump backward",
      mode = { "i", "s" },
    },
  },
  lazy = true,
}
