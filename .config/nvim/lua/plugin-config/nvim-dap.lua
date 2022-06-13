local dap = require('dap')
dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/bin/lldb-vscode',
    name = 'lldb',
}
dap.configurations.c = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    },
}
dap.configurations.rust = dap.configurations.c

table.insert(dap.configurations.c, {
    name = 'Attach to process',
    type = 'c',
    request = 'attach',
    pid = require('dap.utils').pick_process,
    args = {},
})
table.insert(dap.configurations.rust, {
    name = 'Attach to process',
    type = 'rust',
    request = 'attach',
    pid = require('dap.utils').pick_process,
    args = {},
})

local opts = { silent = true }
local tl_dap = require('telescope').extensions.dap
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, opts)
vim.keymap.set('n', '<F5>', dap.continue, opts)
vim.keymap.set('n', '<leader>dr', dap.run_last, opts)
vim.keymap.set('n', '<F6>', dap.step_over, opts)
vim.keymap.set('n', '<F7>', dap.step_into, opts)
vim.keymap.set('n', '<F8>', dap.step_out, opts)
vim.keymap.set('n', '<leader>dj', dap.run_to_cursor, opts)
vim.keymap.set('n', '<leader>du', require('dapui').toggle, opts)
vim.keymap.set('n', '<leader>dfp', tl_dap.commands, opts)
vim.keymap.set('n', '<leader>dfb', tl_dap.list_breakpoints, opts)
vim.keymap.set('n', '<leader>dfv', tl_dap.variables, opts)
vim.keymap.set('n', '<leader>dff', tl_dap.frames, opts)
