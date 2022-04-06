local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

local lir = require('lir')
local utils = lir.utils
local config = lir.config
local Path = require('plenary.path')

local function lcd(path)
    vim.cmd(string.format(':lcd %s', path))
end

local no_confirm_patterns = {
    '^LICENSE$',
    '^Makefile$'
}

local need_confirm = function(filename)
    for _, pattern in ipairs(no_confirm_patterns) do
        if filename:match(pattern) then
            return false
        end
    end
    return true
end

local function input_newfile()
    local save_curdir = vim.fn.getcwd()
    lcd(lir.get_context().dir)
    local name = vim.fn.input('New file: ', '', 'file')
    lcd(save_curdir)

    if name == '' then
        return
    end

    if name == '.' or name == '..' then
        utils.error('Invalid file name: ' .. name)
        return
    end

    if need_confirm(name) then
        if not name:match('%.') and not name:match('/') then
            if vim.fn.confirm("Directory?", "&No\n&Yes", 1) == 2 then
                name = name .. '/'
            end
        end
    end

    local path = Path:new(lir.get_context().dir .. name)
    if string.match(name, '/$') then
        name = name:gsub('/$', '')
        path:mkdir({
            parents = true,
            mode = tonumber('700', 8),
            exists_ok = false
        })
    else
        path:touch({
            parents = true,
            mode = tonumber('644', 8),
        })
    end

    if name:match([[^%.]]) and not config.values.show_hidden_files then
        config.values.show_hidden_files = true
    end

    actions.reload()

    local lnum = lir.get_context():indexof(name:match('^[^/]+'))
    if lnum then
        vim.cmd(tostring(lnum))
    end
end

lir.setup {
    show_hidden_files = true,
    devicons_enable = true,
    natural_sort = true,
    mappings = {
        ['<cr>'] = actions.edit,
        ['l'] = actions.edit,
        ['<C-x>'] = actions.split,
        ['<C-v>'] = actions.vsplit,
        ['<C-t>'] = actions.tabedit,
        ['<bs>'] = actions.up,
        ['h'] = actions.up,
        ['a'] = input_newfile,
        ['r'] = actions.rename,
        ['@'] = actions.cd,
        ['Y'] = actions.yank_path,
        ['.'] = actions.toggle_show_hidden,
        ['D'] = actions.delete,
        ['J'] = function()
            mark_actions.toggle_mark()
            vim.cmd('normal! j')
        end,
        ['y'] = clipboard_actions.copy,
        ['d'] = clipboard_actions.cut,
        ['p'] = clipboard_actions.paste,
    },
    on_init = function()
        vim.api.nvim_buf_set_keymap(
            0,
            "x",
            "J",
            ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
            { noremap = true, silent = true }
        )
    end,
    hide_cursor = true,
}
