local opts = { silent = true }

vim.keymap.set('n', '<leader>gs', '<cmd>vertical G<CR>', opts)
vim.keymap.set('n', '<leader>gw', '<cmd>vertical G blame<CR>', opts)
vim.keymap.set('n', '<leader>gl', '<cmd>vertical G log<CR>', opts)
