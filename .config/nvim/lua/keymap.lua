local M = {}
function M.init()
    local key_opts = {remap = false, silent = true}
    local function map(mode, lhs, rhs, opts)
        vim.keymap.set(mode, lhs, rhs, opts)
    end
    local function nmap(lhs, rhs) map('n', lhs, rhs, key_opts) end
    local function imap(lhs, rhs) map('i', lhs, rhs, key_opts) end
    local function vmap(lhs, rhs) map('v', lhs, rhs, key_opts) end
    local function smap(lhs, rhs) map('s', lhs, rhs, key_opts) end

    local telescope = require('telescope')
    local tl_builtin = require('telescope.builtin')
    local luasnip = require('luasnip')

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
    imap('<C-j>', function() luasnip.jump(-1) end)
    smap('<C-k>', function() luasnip.jump(1) end)
    smap('<C-j>', function() luasnip.jump(-1) end)

    nmap('<leader>bn', '<cmd>bn<CR>')
    nmap('<leader>bp', '<cmd>bp<CR>')
    nmap('<leader>bd', '<cmd>bd<CR>')
    nmap('<leader>bf', tl_builtin.buffers)
    nmap('<leader>bz', tl_builtin.current_buffer_fuzzy_find)

    nmap('<leader>sn', '<cmd>set relativenumber!<CR>')
    nmap('<leader>sw', '<cmd>set wrap!<CR>')
    nmap('<leader>ss', '<cmd>set spell!<CR>')
    nmap('<leader>sc', '<cmd>HexokinaseToggle<CR>')
    nmap('<leader>sl', '<cmd>IndentBlanklineToggle<CR>')
    nmap('<leader>sh', '<cmd>set list!<CR>')

    nmap('<leader>fs', '<cmd>write<CR>')
    nmap('<leader>ff', tl_builtin.find_files)
    nmap('<leader>fg', tl_builtin.live_grep)
    nmap('<leader>fr', tl_builtin.registers)
    nmap('<leader>ft', '<cmd>TodoTelescope<CR>')

    nmap('<leader>oe', '<cmd>edit %:p:h<CR>')
    nmap('<leader>of', telescope.extensions.file_browser.file_browser)
    nmap('<leader>op', function() telescope.extensions.project.project({}) end)
    nmap('<leader>om', telescope.extensions.media_files.media_files)
    nmap('<leader>oE', telescope.extensions.env.env)

    nmap('<leader>gb', tl_builtin.git_branches)
    nmap('<leader>gh', tl_builtin.git_bcommits)
    nmap('<leader>gc', tl_builtin.git_commits)
    nmap('<leader>gs', '<cmd>Neogit<CR>')
    nmap('<leader>gw', '<cmd>G blame<CR>')
end

return M
