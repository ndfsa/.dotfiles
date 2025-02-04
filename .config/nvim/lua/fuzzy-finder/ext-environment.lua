return {
  "LinArcX/telescope-env.nvim",
  config = function()
    require("telescope").load_extension("env")
  end,
  keys = {
    {
      "<leader>fE",
      "<cmd>Telescope env<cr>",
      desc = "Find environment variables",
    },
  },
}
