return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
  init = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
    vim.opt.foldenable = false
    vim.opt.foldlevelstart = 99
    vim.opt.foldlevel = 99
  end,
  opts = {
    ensure_installed = "all",
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = function(_, buf)
        local max_filesize = 100 * 1024
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },
    indent = {
      enable = true,
    },
  },
  main = "nvim-treesitter.configs",
  keys = {
    { "<leader>oT", "<cmd>InspectTree<cr>", desc = "Toggle treesitter tree" },
  },
}
