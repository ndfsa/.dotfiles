require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.integrations.telescope"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/Documents/Notes",
                },
            },
        },
    },
})
