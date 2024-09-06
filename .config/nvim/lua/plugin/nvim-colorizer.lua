return function()
  require("colorizer").setup({
    filetypes = {},
  })

  local opts = require("utils").opts
  vim.keymap.set("n", "<leader>sc", "<cmd>ColorizerToggle<cr>", opts("Set colorizer"))
end
