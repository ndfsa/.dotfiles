local actions = require('lir.actions')
local mark_actions = require('lir.mark.actions')
local clipboard_actions = require('lir.clipboard.actions')

require('lir').setup({
    show_hidden_files = true,
    devicons = { enable = true },
    mappings = {
        ['<cr>'] = actions.edit,
        ['l'] = actions.edit,
        ['<C-x>'] = actions.split,
        ['<C-v>'] = actions.vsplit,
        ['<C-t>'] = actions.tabedit,
        ['<bs>'] = actions.up,
        ['h'] = actions.up,
        ['A'] = actions.mkdir,
        ['a'] = actions.touch,
        ['y'] = clipboard_actions.copy,
        ['d'] = clipboard_actions.cut,
        ['p'] = clipboard_actions.paste,
        ['r'] = actions.rename,
        ['@'] = actions.cd,
        ['.'] = actions.toggle_show_hidden,
        ['x'] = actions.delete,
        ['J'] = function()
            mark_actions.toggle_mark(nil)
            vim.cmd('normal! j')
        end,
        ['Y'] = actions.yank_path,
    },
    on_init = function()
        vim.keymap.set(
            'x',
            'J',
            ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
            { buffer = true, silent = true }
        )
    end,
    hide_cursor = true,
})
