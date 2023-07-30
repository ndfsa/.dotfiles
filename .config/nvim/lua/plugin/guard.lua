local ft = require("guard.filetype")
local opts = require("utils").opts

ft("c"):fmt("clang-format")
ft("lua"):fmt("stylua")
ft("python"):fmt("black")
ft("json"):fmt("prettier")
ft("go"):fmt("lsp")
ft("rust"):fmt("lsp")
ft("sql"):fmt({
    cmd = "sqlfluff",
    args = { "fix", "--disable-progress-bar", "-f", "-n", "--dialect", "postgres", "-" },
    stdin = true,
})

require("guard").setup({
    fmt_on_save = false,
})

-- vim.keymap.set({ "n", "v" }, "<leader>lf", require("guard.format").do_fmt, opts("Format buffer"))
vim.keymap.set("n", "<leader>lf", require("guard.format").do_fmt, opts("Format buffer"))
