return {
  "Vigemus/iron.nvim",
  opts = function(_, opts)
    opts.config = {
      scratch_repl = true,
      repl_definition = {
        python = require("iron.fts.python").ipython,
        sh = {
          command = { "bash" },
        },
      },
      repl_open_cmd = require("iron.view").split.botright("30%"),
    }
    opts.highlight = {}
    opts.ignore_blank_lines = true
  end,
  main = "iron.core",
  keys = {
    {
      "<F5>",
      function()
        require("iron.core").send_line()
      end,
      mode = "n",
      desc = "",
    },
    {
      "<F5>",
      function()
        require("iron.core").visual_send()
      end,
      mode = "v",
      desc = "",
    },
  },
}
