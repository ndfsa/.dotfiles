require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        disable = function(_, buf)
            local max_filesize = 100 * 1024
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    },
    indent = {
        enable = true,
    },
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldlevelstart = 99

vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("treesitter_extras", {
        clear = true,
    }),
    pattern = "sql",
    callback = function(args)
        vim.bo[args.buf].syntax = "on"
    end,
})

local opts = require("utils").opts

vim.keymap.set("n", "<leader>oT", "<cmd>InspectTree<cr>", opts("Toggle treesitter tree"))
