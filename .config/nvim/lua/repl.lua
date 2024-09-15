return {
  "Vigemus/iron.nvim",
  opts = function(_, opts)
    opts.config = {
      scratch_repl = true,
      repl_definition = {
        sh = {
          command = { "bash" },
        },
      },
      repl_open_cmd = require("iron.view").split.botright("30%"),
    }
    opts.keymaps = {
      visual_send = "<F5>",
      send_file = "<F6>",
      send_line = "<F5>",
      exit = "<leader>tq",
      cr = "<leader>t<cr>",
      clear = "<space>tc",
    }
    opts.highlight = {}
    opts.ignore_blank_lines = true
  end,
  lazy = true,
}
