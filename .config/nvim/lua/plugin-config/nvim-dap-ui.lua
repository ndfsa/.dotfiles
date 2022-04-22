local dapui = require('dapui')
dapui.setup()
vim.keymap.set('n', '<leader>du', dapui.toggle, { remap = false, silent = true })
