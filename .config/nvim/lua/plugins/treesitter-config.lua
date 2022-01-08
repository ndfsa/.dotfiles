local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}
require('nvim-treesitter.configs').setup({
    ensure_installed = {
        "bash",
        "c",
        "cmake",
        "comment",
        "css",
        "gdscript",
        "haskell",
        "html",
        "http",
        "norg",
        "norg_meta",
        "norg_table",
        "java",
        "javascript",
        "json",
        "latex",
        "lua",
        "python",
        "query",
        "regex",
        "rust",
        "svelte",
        "toml",
        "tsx",
        "typescript"
    },
    highlight = {
        enable = true,
        disable = {"org"},
        additional_vim_regex_highlighting = {"org"},
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
    }
})
