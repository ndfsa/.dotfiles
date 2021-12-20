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

	map('n', '<leader>bp', ':bp<CR>')
	map('n', '<leader>bn', ':bn<CR>')
	map('n', '<leader>bd', ':bd<CR>')

	map('v', '<A-j>', ':m \'>+1<CR>gv=gv')
	map('v', '<A-k>', ':m \'<-2<CR>gv=gv')

	map('n', '<leader>sn', ':set relativenumber!<CR>')
	map('n', '<leader>sh', ':set hlsearch!<CR>')
	map('n', '<leader>sw', ':set wrap!<CR>')
	map('n', '<leader>ss', ':set spell!<CR>')
	map('n', '<leader>sc', ':ColorizerToggle<CR>')
	map('n', '<leader>sl', ':IndentBlanklineToggle<CR>')
	map('n', '<leader>sb', ':Gitsigns toggle_current_line_blame<CR>')

	map('n', '<leader>fs', ':update<CR>')
	map('n', '<leader>ff', ':Telescope find_files<CR>')
	map('n', '<leader>fg', ':Telescope live_grep<CR>')
	map('n', '<leader>fz', ':Telescope current_buffer_fuzzy_find<CR>')
	map('n', '<leader>fb', ':Telescope buffers<CR>')

	map('n', '<leader>up', '<cmd>lua require("telescope").extensions.project.project{}<CR>')
	map('n', '<leader>ue', ':lua require("lir.float").toggle()<CR>')
	map('n', '<leader>um', ':Telescope marks<CR>')
	map('n', '<leader>ur', ':Telescope registers<CR>')

	map('n', '<leader>gb', ':Telescope git_branches<CR>')
	map('n', '<leader>gs', ':Neogit<CR>')
	map('n', '<leader>gw', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')

	map('n', '<F3>', ':MaximizerToggle<CR>')
	map('v', '<F3>', ':MaximizerToggle<CR>gv')
	map('i', '<F3>', '<C-o>:MaximizerToggle<CR>')
end

return M
