vim.keymap.set('n', '<leader>gB', '<cmd>vertical G blame<CR>', { silent = true })

local opts = { silent = true }
vim.keymap.set('n', '<leader>gs', '<cmd>G<CR>', opts)
vim.keymap.set('n', '<leader>gl', '<cmd>G log<CR>', opts)
