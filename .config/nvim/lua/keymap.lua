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

    nmap('<A-j>', ':m .+1<CR>==')
    nmap('<A-k>', ':m .-2<CR>==')
    imap('<A-j>', '<Esc>:m .+1<CR>==gi')
    imap('<A-k>', '<Esc>:m .-2<CR>==gi')
    vmap('<A-j>', ':m \'>+1<CR>gv=gv')
    vmap('<A-k>', ':m \'<-2<CR>gv=gv')

    nmap('<leader>bn', '<cmd>bn<CR>')
    nmap('<leader>bp', '<cmd>bp<CR>')
    nmap('<leader>bd', '<cmd>bd<CR>')
    nmap('<leader>bf', '<cmd>Telescope buffers<CR>')
    nmap('<leader>bz', '<cmd>Telescope current_buffer_fuzzy_find<CR>')

    nmap('<leader>sn', '<cmd>set relativenumber!<CR>')
    nmap('<leader>sw', '<cmd>set wrap!<CR>')
    nmap('<leader>ss', '<cmd>set spell!<CR>')
    nmap('<leader>sc', '<cmd>HexokinaseToggle<CR>')
    nmap('<leader>sl', '<cmd>IndentBlanklineToggle<CR>')

    nmap('<leader>fs', '<cmd>update<CR>')
    nmap('<leader>ff', '<cmd>Telescope find_files<CR>')
    nmap('<leader>fg', '<cmd>Telescope live_grep<CR>')

    nmap('<leader>oe', '<cmd>edit %:p:h<CR>')
    nmap('<leader>of', '<cmd>lua require"telescope".extensions.file_browser.file_browser()<CR>')
    nmap('<leader>op', '<cmd>Telescope project<CR>')
    nmap('<leader>om', '<cmd>Telescope media_files<CR>')
    nmap('<leader>oE', '<cmd>Telescope env<CR>')

    nmap('<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>')
    nmap('<leader>dr', '<cmd>lua require"dap".run()<CR>')
    nmap('<leader>dk', '<cmd>lua require"dap".continue()<CR>')
    nmap('<leader>dl', '<cmd>lua require"dap".run_last()<CR>')
    nmap('<leader>dc', '<cmd>lua require"dap".terminate()<CR>')
    nmap('<leader>do', '<cmd>lua require"dap".step_over()<CR>')
    nmap('<leader>di', '<cmd>lua require"dap".step_into()<CR>')
    nmap('<leader>dt', '<cmd>lua require"dap".step_out()<CR>')
    nmap('<leader>dj', '<cmd>lua require"dap".run_to_cursor()<CR>')
    nmap('<leader>du', '<cmd>lua require"dapui".toggle()<CR>')
    nmap('<leader>dfp', '<cmd>Telescope dap commands<CR>')
    nmap('<leader>dfb', '<cmd>Telescope dap list_breakpoints<CR>')
    nmap('<leader>dfv', '<cmd>Telescope dap variables<CR>')
    nmap('<leader>dff', '<cmd>Telescope dap frames<CR>')

    nmap('<leader>gb', '<cmd>Telescope git_branches<CR>')
    nmap('<leader>gs', '<cmd>Neogit<CR>')
    nmap('<leader>gw', '<cmd>G blame<CR>')
end

return M
