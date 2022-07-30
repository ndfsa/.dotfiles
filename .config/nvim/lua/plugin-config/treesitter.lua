require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'bash',
        'c',
        'cmake',
        'comment',
        'css',
        'gdscript',
        'haskell',
        'html',
        'http',
        'java',
        'javascript',
        'json',
        'latex',
        'lua',
        'python',
        'query',
        'regex',
        'rust',
        'scala',
        'svelte',
        'toml',
        'tsx',
        'typescript',
        'vue',
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
        },
    },
    indent = {
        enable = true,
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false,
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
})

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldlevel = 99
vim.keymap.set('n', '<leader>oT', '<cmd>TSPlaygroundToggle<cr>', { silent = true })
