local opts = require('utils').opts

require('harpoon').setup({
    save_on_toggle = false,
    save_on_change = true,
    enter_on_sendcmd = false,
    tmux_autoclose_windows = false,
    excluded_filetypes = { 'harpoon' },
    mark_branch = false,
})
vim.keymap.set('n', '<leader>oh', require('harpoon.ui').toggle_quick_menu, opts('Open harpoon'))
