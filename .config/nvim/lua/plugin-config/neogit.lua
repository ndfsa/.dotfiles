require('neogit').setup({
    integrations = {
        diffview = true,
    },
    sections = {
        untracked = {
            folded = true,
        },
        unstaged = {
            folded = true,
        },
        staged = {
            folded = true,
        },
        stashes = {
            folded = true,
        },
        unpulled = {
            folded = true,
        },
        unmerged = {
            folded = true,
        },
        recent = {
            folded = true,
        },
    },
})

local opts = { silent = true }
vim.keymap.set('n', '<leader>gs', '<cmd>Neogit<CR>', opts)
vim.keymap.set('n', '<leader>gl', '<cmd>Neogit log<CR>', opts)
