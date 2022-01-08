require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.keybinds"] = {
            config = {
                default_keybinds = true,
                neorg_leader = '<leader>n',
            }
        },
        ["core.norg.concealer"] = {},
        ["core.norg.completion"] = {
            config = {
                engine = 'nvim-cmp'
            }
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    my_workspace = "~/Documents/neorg"
                }
            }
        }
    },
}
