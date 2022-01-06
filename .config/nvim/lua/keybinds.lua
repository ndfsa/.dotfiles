local M = {}
function M.init()
	local key_opts = {noremap = true, silent = true}
	local function map(mode, lhs, rhs)
		vim.api.nvim_set_keymap(mode, lhs, rhs, key_opts)
	end
	local function nmap(lhs, rhs) map('n', lhs, rhs) end
	local function imap(lhs, rhs) map('i', lhs, rhs) end
	local function vmap(lhs, rhs) map('v', lhs, rhs) end

	nmap('k', 'gk')
	nmap('j', 'gj')

	nmap('n', 'nzzzv')
	nmap('N', 'Nzzzv')

	vmap('>', '>gv')
	vmap('<', '<gv')

	imap(',', ',<C-g>u')
	imap('.', '.<C-g>u')
	imap('!', '!<C-g>u')
	imap('?', '?<C-g>u')
	imap('-', '-<C-g>u')
	imap('_', '_<C-g>u')

	nmap('<leader>bp', '<cmd>bp<CR>')
	nmap('<leader>bn', '<cmd>bn<CR>')
	nmap('<leader>bd', '<cmd>bd<CR>')

	vmap('<A-j>', '<cmd>m \'>+1<CR>gv=gv')
	vmap('<A-k>', '<cmd>m \'<-2<CR>gv=gv')

	nmap('<leader>sn', '<cmd>set relativenumber!<CR>')
	nmap('<leader>sh', '<cmd>set hlsearch!<CR>')
	nmap('<leader>sw', '<cmd>set wrap!<CR>')
	nmap('<leader>ss', '<cmd>set spell!<CR>')
	nmap('<leader>sc', '<cmd>ColorizerToggle<CR>')
	nmap('<leader>sl', '<cmd>IndentBlanklineToggle<CR>')
	nmap('<leader>sb', '<cmd>Gitsigns toggle_current_line_blame<CR>')

	nmap('<leader>fs', '<cmd>update<CR>')
	nmap('<leader>ff', '<cmd>Telescope find_files<CR>')
	nmap('<leader>fg', '<cmd>Telescope live_grep<CR>')
	nmap('<leader>fz', '<cmd>Telescope current_buffer_fuzzy_find<CR>')
	nmap('<leader>fb', '<cmd>Telescope buffers<CR>')

	nmap('<leader>op', '<cmd>Telescope project<CR>')
	nmap('<leader>om', '<cmd>Telescope media_files<CR>')
	nmap('<leader>oe', '<cmd>lua require"telescope".extensions.file_browser.file_browser()<CR>')

	nmap('<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
	nmap('<leader>do', '<cmd>lua require"dap".step_over()<CR>')
	nmap('<leader>di', '<cmd>lua require"dap".step_into()<CR>')
	nmap('<leader>dt', '<cmd>lua require"dap".step_out()<CR>')
	nmap('<leader>dc', '<cmd>lua require"dap".close()<CR>')
	nmap('<leader>dr', '<cmd>lua require"dap".continue()<CR>')
	nmap('<leader>du', '<cmd>lua require"dapui".toggle()<CR>')

	nmap('<leader>gb', '<cmd>Telescope git_branches<CR>')
	nmap('<leader>gs', '<cmd>Neogit<CR>')
	nmap('<leader>gw', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')

	nmap('<F3>', '<cmd>MaximizerToggle<CR>')
	vmap('<F3>', '<cmd>MaximizerToggle<CR>gv')
	imap('<F3>', '<C-o><cmd>MaximizerToggle<CR>')
end

return M
