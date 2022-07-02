vim.keymap.set('n', '<leader>gw', '<cmd>vertical G blame<CR>', { silent = true })

local opts = { silent = true }
vim.keymap.set('n', '<leader>gs', '<cmd>G<CR>', opts)
vim.keymap.set('n', '<leader>gl', '<cmd>G log<CR>', opts)
