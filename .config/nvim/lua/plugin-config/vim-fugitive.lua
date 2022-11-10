local opts = require('utils').opts

vim.keymap.set('n', '<leader>gB', '<cmd>vertical G blame<CR>', opts("Git blame"))
vim.keymap.set('n', '<leader>gs', '<cmd>tab G<CR>', opts("Git status"))
vim.keymap.set('n', '<leader>gl', '<cmd>tab G log --oneline --graph<CR>', opts("Git log"))
vim.keymap.set('n', '<leader>gh', '<cmd>0Gclog<CR>', opts("Git file history"))
vim.keymap.set('n', '<leader>gc', '<cmd>G difftool<CR>', opts("Git project diff tool"))
