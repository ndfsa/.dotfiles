vim.g.indent_blankline_enabled = false
require("indent_blankline").setup({
    char = "│",
    buftype_exclude = { "terminal" },
})

local opts = require("utils").opts

vim.keymap.set("n", "<leader>sl", "<cmd>IndentBlanklineToggle<CR>", opts("Set indent blank line"))
