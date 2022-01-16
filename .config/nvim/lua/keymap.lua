local M = {}
function M.init()
    local key_opts = {noremap = true, silent = true}
    local function map(mode, lhs, rhs, opts)
        vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
    end
    local function nmap(lhs, rhs) map('n', lhs, rhs, key_opts) end
    local function imap(lhs, rhs) map('i', lhs, rhs, key_opts) end
    local function vmap(lhs, rhs) map('v', lhs, rhs, key_opts) end
    local function smap(lhs, rhs) map('s', lhs, rhs, key_opts) end

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

    -- thank you TJ https://github.com/tjdevries/config_manager
    map('i', '<C-k>', [[luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '']],
        {silent = true, expr = true})
    imap('<C-j>', '<cmd>lua require("luasnip").jump(-1)<CR>')
    smap('<C-k>', '<cmd>lua require("luasnip").jump(1)<CR>')
    smap('<C-j>', '<cmd>lua require("luasnip").jump(-1)<CR>')

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
    nmap('<leader>sh', '<cmd>set list!<CR>')

    nmap('<leader>fs', '<cmd>write<CR>')
    nmap('<leader>ff', '<cmd>Telescope find_files<CR>')
    nmap('<leader>fg', '<cmd>Telescope live_grep<CR>')

    nmap('<leader>oe', '<cmd>edit %:p:h<CR>')
    nmap('<leader>of', '<cmd>lua require"telescope".extensions.file_browser.file_browser()<CR>')
    nmap('<leader>op', '<cmd>Telescope project<CR>')
    nmap('<leader>om', '<cmd>Telescope media_files<CR>')
    nmap('<leader>oE', '<cmd>Telescope env<CR>')

    nmap('<leader>gb', '<cmd>Telescope git_branches<CR>')
    nmap('<leader>gs', '<cmd>Neogit<CR>')
    nmap('<leader>gw', '<cmd>G blame<CR>')
end

return M
