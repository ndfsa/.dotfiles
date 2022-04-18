local map = vim.keymap.set
local tl_ext = require('telescope').extensions
local tl_builtin = require('telescope.builtin')
local luasnip = require('luasnip')
local dap = require('dap')

local opts = { remap = false, silent = true }
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

map('v', '>', '>gv', opts)
map('v', '<', '<gv', opts)

map('i', ',', ',<C-g>u', opts)
map('i', '.', '.<C-g>u', opts)
map('i', '!', '!<C-g>u', opts)
map('i', '?', '?<C-g>u', opts)
map('i', '-', '-<C-g>u', opts)
map('i', '_', '_<C-g>u', opts)

map('n', '<A-j>', ':m .+1<CR>==', opts)
map('n', '<A-k>', ':m .-2<CR>==', opts)
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
map('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
map('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- thank you TJ https://github.com/tjdevries
map({ 'i', 's' }, '<C-k>', function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })
map({ 'i', 's' }, '<C-j>', function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })

map('n', '<leader><space>', tl_builtin.buffers, opts)

map('n', '<leader>bn', '<cmd>bn<CR>', opts)
map('n', '<leader>bp', '<cmd>bp<CR>', opts)
map('n', '<leader>bd', '<cmd>bd<CR>', opts)
map('n', '<leader>bz', tl_builtin.current_buffer_fuzzy_find, opts)

map('n', '<leader>sn', '<cmd>set relativenumber!<CR>', opts)
map('n', '<leader>sw', '<cmd>set wrap!<CR>', opts)
map('n', '<leader>ss', '<cmd>set spell!<CR>', opts)
map('n', '<leader>sc', '<cmd>HexokinaseToggle<CR>', opts)
map('n', '<leader>sl', '<cmd>IndentBlanklineToggle<CR>', opts)
map('n', '<leader>sh', '<cmd>set list!<CR>', opts)

map('n', '<leader>fs', '<cmd>write<CR>', opts)
map('n', '<leader>ff', tl_builtin.find_files, opts)
map('n', '<leader>fp', vim.lsp.buf.formatting, opts)
map('v', '<leader>fp', vim.lsp.buf.range_formatting, opts)
map('n', '<leader>fg', tl_builtin.live_grep, opts)
map('n', '<leader>fr', tl_builtin.registers, opts)
map('n', '<leader>ft', '<cmd>TodoTelescope<CR>', opts)

map('n', '<leader>oe', '<cmd>edit %:p:h<CR>', opts)
map('n', '<leader>of', tl_ext.file_browser.file_browser, opts)
map('n', '<leader>op', function()
    tl_ext.project.project({})
end, opts)
map('n', '<leader>om', tl_ext.media_files.media_files, opts)
map('n', '<leader>oE', tl_ext.env.env, opts)
map('n', '<leader>ot', '<cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>on', '<cmd>ZkNotes<CR>', opts)

map('n', '<leader>db', dap.toggle_breakpoint, opts)
map('n', '<F5>', dap.continue, opts)
map('n', '<leader>dr', dap.run_last, opts)
map('n', '<F6>', dap.step_over, opts)
map('n', '<F7>', dap.step_into, opts)
map('n', '<F8>', dap.step_out, opts)
map('n', '<leader>dj', dap.run_to_cursor, opts)
map('n', '<leader>du', require('dapui').toggle, opts)
map('n', '<leader>dfp', tl_ext.dap.commands, opts)
map('n', '<leader>dfb', tl_ext.dap.list_breakpoints, opts)
map('n', '<leader>dfv', tl_ext.dap.variables, opts)
map('n', '<leader>dff', tl_ext.dap.frames, opts)

map('n', '<leader>gb', tl_builtin.git_branches, opts)
map('n', '<leader>gh', tl_builtin.git_bcommits, opts)
map('n', '<leader>gc', tl_builtin.git_commits, opts)
map('n', '<leader>gs', '<cmd>vertical G<CR>', opts)
map('n', '<leader>gw', '<cmd>vertical G blame<CR>', opts)
map('n', '<leader>gl', '<cmd>vertical G log<CR>', opts)
