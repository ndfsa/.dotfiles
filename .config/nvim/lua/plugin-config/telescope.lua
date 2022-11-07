local telescope = require('telescope')
telescope.setup({
    defaults = {
        sorting_strategy = 'ascending',
        layout_strategy = 'vertical',
        layout_config = {
            prompt_position = 'top',
            mirror = true,
        },
        preview = true,
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
telescope.load_extension('harpoon')

local tl_ext = telescope.extensions
local tl_builtin = require('telescope.builtin')
local opts = { silent = true }

vim.keymap.set('n', '<leader><space>', tl_builtin.find_files, opts)
vim.keymap.set('n', '<leader>oh', require('harpoon.ui').toggle_quick_menu, opts)

vim.keymap.set('n', '<leader>bz', tl_builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set('n', '<leader>fg', tl_builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fr', tl_builtin.registers, opts)
vim.keymap.set('n', '<leader>of', tl_ext.file_browser.file_browser, opts)
vim.keymap.set('n', '<leader>ob', tl_builtin.buffers, opts)
vim.keymap.set('n', '<leader>op', function()
    tl_ext.project.project({})
end, opts)
vim.keymap.set('n', '<leader>om', tl_ext.media_files.media_files, opts)
vim.keymap.set('n', '<leader>oE', tl_ext.env.env, opts)
