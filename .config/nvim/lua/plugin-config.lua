local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  defaults = { lazy = true },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      functionStyle = { bold = true },
      keywordStyle = { bold = true },
      statementStyle = { bold = true },
    },
    init = function()
      vim.cmd("colorscheme kanagawa")
    end,
  },
  {
    "echasnovski/mini.icons",
    lazy = false,
    config = function()
      local icons = require("mini.icons")
      icons.mock_nvim_web_devicons()
      icons.tweak_lsp_kind()
    end,
  },
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      columns = { "permissions", "mtime", "size", "icon" },
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
    },
  },
  { "nvim-lua/plenary.nvim" },
  {
    "sQVe/sort.nvim",
    lazy = false,
    cmd = "Sort",
  },
  {
    "NeogitOrg/neogit",
    opts = {},
    keys = {
      { "<leader>gs", "<cmd>Neogit<cr>", desc = "Open Neogit" },
    },
  },
  {
    "fredeeb/tardis.nvim",
    opts = {},
    keys = {
      { "<leader>gH", "<cmd>Tardis git<cr>", desc = "Open time capsule" },
    },
  },
  {
    "FabijanZulj/blame.nvim",
    opts = {},
    keys = {
      { "<leader>gB", "<cmd>BlameToggle window<cr>", desc = "Open git blame" },
    },
  },
  {
    "catgoose/nvim-colorizer.lua",
    opts = { filetypes = {} },
    keys = {
      { "<leader>sc", "<cmd>ColorizerToggle<cr>", desc = "Set colorizer" },
    },
  },
  {
    "monkoose/matchparen.nvim",
    lazy = false,
    opts = {},
  },
  {
    "nmac427/guess-indent.nvim",
    opts = { autocmd = false },
    cmd = "GuessIndent",
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  { "ashfinal/qfview.nvim" },
  {
    "echasnovski/mini.ai",
    opts = {
      search_method = "cover",
    },
  },
  { "echasnovski/mini.surround", opts = {} },
  { "echasnovski/mini.diff", opts = {} },
  { "LunarVim/bigfile.nvim", opts = { filesize = 0.5 } },
  {
    "jiaoshijie/undotree",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {
      window = {
        winblend = 0,
      },
    },
    keys = {
      { "<leader>ou", "<cmd>lua require('undotree').toggle()<cr>", desc = "Open undo tree" },
    },
  },
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "echasnovski/mini.icons",
  --   },
  --   ft = { "markdown" },
  --   opts = {},
  -- },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },
  { "echasnovski/mini.statusline", opts = {} },
  require("lsp-servers"),
  require("treesitter"),
  require("snippets"),
  require("completion"),
  require("formatter"),
  require("repl"),
  require("code-highlight"),
  -- require("folding"),
  require("fuzzy-finder"),
})
