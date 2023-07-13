require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

local opts = require("utils").opts

vim.keymap.set(
    "n",
    "<leader>oT",
    "<cmd>InspectTree<cr>",
    opts("Toggle treesitter tree")
)
