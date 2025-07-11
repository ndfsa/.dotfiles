return {
  "echasnovski/mini.completion",
  dependencies = "rafamadriz/friendly-snippets",
  opts = {},
  init = function()
    vim.keymap.set("i", "<CR>", function()
      if vim.fn.complete_info()["selected"] ~= -1 then
        return "\25"
      end
      return "\r"
    end, { expr = true })
  end,
}
