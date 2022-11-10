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
        file_ignore_patterns = { '.git/', 'node_modules/', '.stack-work/' },
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
local opts = require('utils').opts

vim.keymap.set('n', '<leader><space>', tl_builtin.find_files, opts('Find file'))
vim.keymap.set('n', '<leader>oh', require('harpoon.ui').toggle_quick_menu, opts('Open harpoon'))

vim.keymap.set('n', '<leader>bz', tl_builtin.current_buffer_fuzzy_find, opts('Buffer fuzzy find'))
vim.keymap.set('n', '<leader>fg', tl_builtin.live_grep, opts('Find grep'))
vim.keymap.set('n', '<leader>fr', tl_builtin.registers, opts('Find registers'))
vim.keymap.set('n', '<leader>fh', tl_ext.file_browser.file_browser, opts('Find file here'))
vim.keymap.set('n', '<leader>fb', tl_builtin.buffers, opts('Find buffers'))
vim.keymap.set('n', '<leader>op', function()
    tl_ext.project.project({})
end, opts('Open projects'))
vim.keymap.set('n', '<leader>fm', tl_ext.media_files.media_files, opts('Find media files'))
vim.keymap.set('n', '<leader>fE', tl_ext.env.env, opts('Find environment variables'))
