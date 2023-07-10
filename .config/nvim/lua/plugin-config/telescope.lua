local telescope = require("telescope")
local ignore_patterns = { "%.git[/\\]" }

telescope.setup({
    defaults = {
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        layout_config = {
            prompt_position = "top",
            mirror = true,
        },
        preview = true,
        file_ignore_patterns = ignore_patterns,
        vimgrep_arguments = {
            "rg",
            "--hidden",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
    },
    pickers = {
        find_files = {
            hidden = true,
        },
    },
})
telescope.load_extension("fzf")
telescope.load_extension("project")
telescope.load_extension("env")
telescope.load_extension("zk")
telescope.load_extension("ui-select")

local tl_ext = telescope.extensions
local tl_builtin = require("telescope.builtin")
local opts = require("utils").opts

vim.keymap.set("n", "<leader><space>", function()
    local notes = vim.fs.find(".zk", { type = "directory" })
    if #notes > 0 then
        tl_ext.zk.notes()
        return
    end

    local git = vim.fs.find(".git", { type = "directory" })
    if #git > 0 then
        tl_builtin.git_files()
        return
    end

    tl_builtin.find_files()
end, opts("Find file"))

vim.keymap.set("n", "<leader>bz", tl_builtin.current_buffer_fuzzy_find, opts("Buffer fuzzy find"))
vim.keymap.set("n", "<leader>fg", tl_builtin.live_grep, opts("Find grep"))
vim.keymap.set("n", "<leader>fr", tl_builtin.registers, opts("Find registers"))
vim.keymap.set("n", "<leader>fb", tl_builtin.buffers, opts("Find buffers"))
vim.keymap.set("n", "<leader>fp", function()
    tl_ext.project.project({})
end, opts("Find projects"))
vim.keymap.set("n", "<leader>fE", tl_ext.env.env, opts("Find environment variables"))
vim.keymap.set(
    "n",
    "<leader>fn",
    "<cmd>Telescope zk notes<cr>",
    opts("Find environment variables")
)
vim.keymap.set("n", "<leader>ft", "<cmd>Telescope zk tags<cr>", opts("Find environment variables"))
