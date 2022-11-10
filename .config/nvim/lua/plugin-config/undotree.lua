vim.g.undotree_SplitWidth = 40

local opts = require('utils').opts

vim.keymap.set('n', '<leader>ou', '<cmd>UndotreeToggle<CR>', opts('Open undo tree'))
