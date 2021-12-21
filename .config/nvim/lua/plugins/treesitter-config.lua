local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
	install_info = {
		url = 'https://github.com/milisims/tree-sitter-org',
		revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
		files = {'src/parser.c', 'src/scanner.cc'},
	},
	filetype = 'org',
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
		"java",
		"javascript",
		"json",
		"latex",
		"lua",
		"org",
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
