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
    lazy = true,
    cmd = "Sort",
  },
  {
    "anuvyklack/pretty-fold.nvim",
    opts = {
      sections = { left = { "content" } },
      fill_char = " ",
    },
  },
  {
    "NeogitOrg/neogit",
    config = true,
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
  { "folke/which-key.nvim" },
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
    version = false,
  },
  { "echasnovski/mini.surround", opts = {} },
  { "echasnovski/mini.diff", opts = {} },
  require("bar"),
  require("lsp-servers"),
  require("treesitter"),
  require("snippets"),
  require("completion"),
  require("fuzzy-finder"),
  require("formatting"),
  require("repl"),
})
