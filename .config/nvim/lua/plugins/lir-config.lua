local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'

require'lir'.setup {
	show_hidden_files = true,
	devicons_enable = true,
	mappings = {
		['<cr>'] = actions.edit,
		['l'] = actions.edit,
		['<C-x>'] = actions.split,
		['<C-v>'] = actions.vsplit,
		['<C-t>'] = actions.tabedit,
		['<bs>'] = actions.up,
		['h'] = actions.up,
		['q'] = actions.quit,
		['<esc>'] = actions.quit,
		['K'] = actions.mkdir,
		['a'] = actions.newfile,
		['r'] = actions.rename,
		['@'] = actions.cd,
		['Y'] = actions.yank_path,
		['.'] = actions.toggle_show_hidden,
		['D'] = actions.delete,
		['J'] = function()
			mark_actions.toggle_mark()
			vim.cmd('normal! j')
		end,
		['y'] = clipboard_actions.copy,
		['d'] = clipboard_actions.cut,
		['p'] = clipboard_actions.paste,
	},
	float = {
		winblend = 0,
		curdir_window = {
			enable = true,
			highlight_dirname = true
		}
	},
	on_init = function()
		vim.api.nvim_buf_set_keymap(
			0,
			"x",
			"J",
			':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
			{ noremap = true, silent = true }
		)

		vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
	end,
	hide_cursor = true,
}
require'nvim-web-devicons'.setup({
	override = {
		lir_folder_icon = {
			icon = "",
			color = "#8094b4",
			name = "LirFolderNode"
		},
	}
})
