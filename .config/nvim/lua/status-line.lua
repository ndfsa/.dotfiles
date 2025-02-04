local small_mode = {
  "mode",
  fmt = function()
    return " "
  end,
}
return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "echasnovski/mini.icons" },
  opts = {
    options = {
      theme = "kanagawa",
      section_separators = " ",
      component_separators = " ",
      globalstatus = true,
    },
    sections = {
      lualine_a = { small_mode },
      lualine_b = {
        "filename",
      },
      lualine_c = {
        "branch",
        "filesize",
        "diff",
        { "diagnostics", sources = { "nvim_diagnostic" } },
      },
      lualine_x = {
        "searchcount",
        "selectioncount",
        { "fileformat", icons_enabled = false },
        "progress",
        "location",
      },
      lualine_y = { "filetype" },
      lualine_z = { small_mode },
    },
    extensions = { "quickfix", "fugitive", "lazy", "man", "oil" },
  },
}
