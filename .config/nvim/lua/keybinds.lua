local M = {}
function M.init()
	local key_opts = {noremap = true, silent = true}
	local function map(mode, lhs, rhs)
		vim.api.nvim_set_keymap(mode, lhs, rhs, key_opts)
	end
	map('n', 'n', 'nzzzv')
	map('n', 'N', 'Nzzzv')

	map('v', '>', '>gv')
	map('v', '<', '<gv')

	map('i', ',', ',<C-g>u')
	map('i', '.', '.<C-g>u')
	map('i', '!', '!<C-g>u')
	map('i', '?', '?<C-g>u')
	map('i', '-', '-<C-g>u')
	map('i', '_', '_<C-g>u')

	map('n', '<leader>bp', '<cmd>bp<CR>')
	map('n', '<leader>bn', '<cmd>bn<CR>')
	map('n', '<leader>bd', '<cmd>bd<CR>')

	map('v', '<A-j>', '<cmd>m \'>+1<CR>gv=gv')
	map('v', '<A-k>', '<cmd>m \'<-2<CR>gv=gv')

	map('n', '<leader>sn', '<cmd>set relativenumber!<CR>')
	map('n', '<leader>sh', '<cmd>set hlsearch!<CR>')
	map('n', '<leader>sw', '<cmd>set wrap!<CR>')
	map('n', '<leader>ss', '<cmd>set spell!<CR>')
	map('n', '<leader>sc', '<cmd>ColorizerToggle<CR>')
	map('n', '<leader>sl', '<cmd>IndentBlanklineToggle<CR>')
	map('n', '<leader>sb', '<cmd>Gitsigns toggle_current_line_blame<CR>')

	map('n', '<leader>fs', '<cmd>update<CR>')
	map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
	map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
	map('n', '<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
	map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')

	map('n', '<leader>op', '<cmd>lua require("telescope").extensions.project.project{}<CR>')
	map('n', '<leader>oe', '<cmd>lua require("lir.float").toggle()<CR>')

	map('n', '<leader>gb', '<cmd>Telescope git_branches<CR>')
	map('n', '<leader>gs', '<cmd>Neogit<CR>')
	map('n', '<leader>gw', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')

	map('n', '<F3>', '<cmd>MaximizerToggle<CR>')
	map('v', '<F3>', '<cmd>MaximizerToggle<CR>gv')
	map('i', '<F3>', '<C-o><cmd>MaximizerToggle<CR>')
end

return M
