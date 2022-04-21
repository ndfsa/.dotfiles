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
