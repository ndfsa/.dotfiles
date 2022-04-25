local telescope = require('telescope')
telescope.setup({
    defaults = {
        sorting_strategy = 'ascending',

        layout_config = {
            prompt_position = 'top',
        },
        file_ignore_patterns = { '.git/', 'node_modules/' },
    },
    extensions = {
        fzf = {
            fuzzy = true,
        },
        file_browser = {
            hidden = true,
            cwd = '%:h:p',
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            file_ignore_patterns = { '.git/', 'node_modules/' },
        },
        live_grep = {
            vimgrep_arguments = {
                'rg',
                '--color=never',
                '--no-heading',
                '--with-filename',
                '--line-number',
                '--column',
                '--smart-case',
                '--hidden',
                '--glob',
                '!.git/',
            },
        },
    },
})
telescope.load_extension('fzf')
telescope.load_extension('project')
telescope.load_extension('media_files')
telescope.load_extension('file_browser')
telescope.load_extension('env')

local tl_ext = telescope.extensions
local tl_builtin = require('telescope.builtin')
local opts = { silent = true }

vim.keymap.set('n', '<leader><space>', tl_builtin.buffers, opts)
vim.keymap.set('n', '<leader>bz', tl_builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set('n', '<leader>ff', tl_builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', tl_builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fr', tl_builtin.registers, opts)
vim.keymap.set('n', '<leader>of', tl_ext.file_browser.file_browser, opts)
vim.keymap.set('n', '<leader>op', function()
    tl_ext.project.project({})
end, opts)
vim.keymap.set('n', '<leader>om', tl_ext.media_files.media_files, opts)
vim.keymap.set('n', '<leader>oE', tl_ext.env.env, opts)

vim.keymap.set('n', '<leader>gb', tl_builtin.git_branches, opts)
vim.keymap.set('n', '<leader>gh', tl_builtin.git_bcommits, opts)
vim.keymap.set('n', '<leader>gc', tl_builtin.git_commits, opts)
