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
  {
    "rebelot/kanagawa.nvim",
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
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "stevearc/oil.nvim",
    opts = {
      columns = { "permissions", "mtime", "size", "icon" },
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
    },
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "sQVe/sort.nvim",
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
    "NvChad/nvim-colorizer.lua",
    opts = { filetypes = {} },
    keys = {
      { "<leader>sc", "<cmd>ColorizerToggle<cr>", desc = "Set colorizer" },
    },
  },
  { "monkoose/matchparen.nvim", opts = {} },
  {
    "nmac427/guess-indent.nvim",
    opts = { autocmd = false },
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
  {
    "folke/twilight.nvim",
    opts = {
      context = -1,
      treesitter = true,
    },
    lazy = true,
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
  require("statusbar"),
  require("lsp-servers"),
  require("treesitter"),
  require("snippets"),
  require("completion"),
  require("fuzzy-finder"),
  require("formatting"),
  require("repl"),
})
