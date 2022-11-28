local telescope = require('telescope')
local ignore_patterns = { '.git/' }

telescope.setup({
    defaults = {
        sorting_strategy = 'ascending',
        layout_strategy = 'vertical',
        layout_config = {
            prompt_position = 'top',
            mirror = true,
        },
        preview = true,
        file_ignore_patterns = ignore_patterns,
    },
    extensions = {
        file_browser = {
            hidden = true,
            cwd = '%:h:p',
        },
    },
    pickers = {
        find_files = {
            hidden = true,
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
local opts = require('utils').opts

vim.keymap.set('n', '<leader><space>', tl_builtin.find_files, opts('Find file'))

vim.keymap.set('n', '<leader>bz', tl_builtin.current_buffer_fuzzy_find, opts('Buffer fuzzy find'))
vim.keymap.set('n', '<leader>fg', tl_builtin.live_grep, opts('Find grep'))
vim.keymap.set('n', '<leader>fr', tl_builtin.registers, opts('Find registers'))
vim.keymap.set('n', '<leader>fh', tl_ext.file_browser.file_browser, opts('Find file here'))
vim.keymap.set('n', '<leader>fb', tl_builtin.buffers, opts('Find buffers'))
vim.keymap.set('n', '<leader>fp', function()
    tl_ext.project.project({})
end, opts('Find projects'))
vim.keymap.set('n', '<leader>fm', tl_ext.media_files.media_files, opts('Find media files'))
vim.keymap.set('n', '<leader>fE', tl_ext.env.env, opts('Find environment variables'))
