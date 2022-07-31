require('telescope').setup{
	defaults = {
		layout_strategy = "bottom_pane",
		layout_config = {
			height = 20,
			prompt_position = "bottom"
		},
		preview_title = "",
		border = false,
		file_ignore_patterns = {'.git', 'node_modules'}
	},
	pickers = {
		find_files = {
			hidden = true
		},
		file_browser = {
			hidden = true
		},
		live_grep = {
			vimgrep_arguments = {
				'rg',
				'--color=never',
				'--no-heading',
				'--with-filename',
				'--line-number',
				'--column',
				'--smart-case',
				'--hidden',
				'--glob',
				'!.git'
			}
		}
	}
}
require('telescope').load_extension('fzf')
