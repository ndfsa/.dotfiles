local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.org = {
	install_info = {
		url = 'https://github.com/milisims/tree-sitter-org',
		revision = 'main',
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
		"json",
		"latex",
		"lua",
		"org",
		"python",
		"regex",
		"toml",
		"tsx",
		"typescript"
	},
	highlight = {
		enable = true,
		disable = {"org"},
		additional_vim_regex_highlighting = {"org"},
	}
})
