vim.keymap.set('n', '<leader>gB', '<cmd>vertical G blame<CR>', { silent = true })

local opts = { silent = true }
vim.keymap.set('n', '<leader>gs', '<cmd>tab G<CR>', opts)
vim.keymap.set('n', '<leader>gl', '<cmd>tab G log --oneline<CR>', opts)
vim.keymap.set('n', '<leader>gh', '<cmd>0Gclog<CR>', opts)
vim.keymap.set('n', '<leader>gc', '<cmd>G difftool<CR>', opts)
