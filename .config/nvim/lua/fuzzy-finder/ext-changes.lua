return {
  "LinArcX/telescope-changes.nvim",
  config = function()
    require("telescope").load_extension("changes")
  end,
  keys = {
    {
      "<leader>fc",
      "<cmd>Telescope changes<cr>",
      desc = "Find changes",
    },
  },
}
