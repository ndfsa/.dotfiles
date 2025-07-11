return {
  "chrisgrieser/nvim-origami",
  event = "VeryLazy",
  opts = {
    useLspFoldsWithTreesitterFallback = true,
    pauseFoldsOnSearch = true,
    foldtext = {
      enabled = true,
      padding = 3,
      lineCount = {
        template = "%d lines",
        hlgroup = "Comment",
      },
      diagnosticsCount = false,
      gitsignsCount = false,
    },
    autoFold = {
      enabled = false,
    },
    foldKeymaps = {
      setup = false,
      hOnlyOpensOnFirstColumn = false,
    },
  },
  init = function()
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
  end,
}
