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
        runInTerminal = false,
    },
}

dap.configurations.rust = dap.configurations.c

local opts = { remap = false, silent = true }
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, opts)
vim.keymap.set('n', '<F5>', dap.continue, opts)
vim.keymap.set('n', '<leader>dr', dap.run_last, opts)
vim.keymap.set('n', '<F6>', dap.step_over, opts)
vim.keymap.set('n', '<F7>', dap.step_into, opts)
vim.keymap.set('n', '<F8>', dap.step_out, opts)
vim.keymap.set('n', '<leader>dj', dap.run_to_cursor, opts)
