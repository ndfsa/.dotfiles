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
        'toml',
        'tsx',
        'typescript',
        'vue',
    },
    highlight = {
        enable = true,
        disable = { 'org' },
        additional_vim_regex_highlighting = { 'org' },
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
