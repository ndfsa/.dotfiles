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
    config = function(_, opts)
      require("kanagawa").setup(opts)
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
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "kanagawa",
        section_separators = " ",
        component_separators = " ",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "filesize" },
        lualine_c = {
          { "diagnostics", sources = { "nvim_diagnostic" } },
          "filename",
          "branch",
        },
        lualine_x = {
          "progress",
          "location",
        },
        lualine_y = { "filetype" },
        lualine_z = {
          { "fileformat", icons_enabled = false, fmt = string.upper },
        },
      },
      extensions = { "quickfix", "fugitive", "lazy", "man", "oil" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = require("plugin.lspconfig"),
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = require("plugin.treesitter"),
  },
  {
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
  },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "saadparwaiz1/cmp_luasnip" },
  { "onsails/lspkind-nvim" },
  {
    "hrsh7th/nvim-cmp",
    config = require("plugin.cmp"),
  },
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "debugloop/telescope-undo.nvim" },
  { "LinArcX/telescope-env.nvim" },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },
  {
    "nvim-telescope/telescope.nvim",
    config = require("plugin.telescope"),
  },
  {
    "sQVe/sort.nvim",
    lazy = true,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    opts = {
      sections = { left = { "content" } },
      fill_char = " ",
    },
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gB", "<cmd>vertical G blame<CR>", desc = "Git blame" },
      { "<leader>gs", "<cmd>tab G<CR>", "Git status" },
      { "<leader>gl", "<cmd>tab G log --oneline --graph --all<CR>", desc = "Git commits" },
      { "<leader>gL", "<cmd>tab G log --graph<CR>", desc = "Git full log" },
      { "<leader>gh", "<cmd>tab split | 0Gclog<CR>", desc = "Git file history" },
      { "<leader>gc", "<cmd>G difftool<CR>", desc = "Git project diff tool" },
      { "<leader>gR", "<cmd>G restore %<CR>", desc = "Git restore current file" },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = { filetypes = {} },
    keys = {
      { "<leader>sc", "<cmd>ColorizerToggle<cr>", desc = "Set colorizer" },
    },
  },
  { "monkoose/matchparen.nvim" },
  {
    "nmac427/guess-indent.nvim",
    opts = { autocmd = false },
  },
  {
    "folke/which-key.nvim",
  },
  {
    "stevearc/conform.nvim",
    config = require("plugin.conform"),
  },
  {
    "folke/twilight.nvim",
    opts = {
      context = -1,
      treesitter = true,
    },
  },
  {
    "ashfinal/qfview.nvim",
  },
  {
    "echasnovski/mini.ai",
    opts = {
      search_method = "cover",
    },
  },
  {
    "echasnovski/mini.surround",
  },
  {
    "echasnovski/mini.diff",
  },
  { "ThePrimeagen/git-worktree.nvim" },
  {
    "Vigemus/iron.nvim",
    config = require("plugin.iron"),
    lazy = true,
  },
})
