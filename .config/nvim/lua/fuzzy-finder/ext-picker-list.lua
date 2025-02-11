return {
  "ndfsa/telescope-picker-list.nvim",
  config = function()
    require("telescope").load_extension("picker_list")
  end,
  keys = {
    {"<leader>fp", "<cmd>Telescope picker_list<cr>", desc = "Find pickers"}
  }
}
