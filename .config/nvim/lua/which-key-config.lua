require("which-key").setup({
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = false,
			suggestions = 20,
		},
		presets = {
			operators = true,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	operators = {},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	window = {
		border = "none",
		position = "bottom",
		margin = { 1, 1, 1, 1 },
		padding = { 0, 0, 0, 0 },
	},
	layout = {
		height = { min = 4, max = 20 },
		width = { min = 20, max = 50 },
		spacing = 2,
		align = "left",
	},
	ignore_missing = false,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},
	show_help = true,
	triggers = "auto",
	-- triggers = {"<leader>"},
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
})

