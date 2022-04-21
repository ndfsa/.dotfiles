local tl_ext = require('telescope').extensions
local tl_builtin = require('telescope.builtin')
local luasnip = require('luasnip')
local dap = require('dap')

local opts = { remap = false, silent = true }
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set(
    'n',
    'k',
    [[v:count == 0 ? 'gk' : 'k']],
    { expr = true, remap = false, silent = true }
)
vim.keymap.set(
    'n',
    'j',
    [[v:count == 0 ? 'gj' : 'j']],
    { expr = true, remap = false, silent = true }
)

vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set('v', '<', '<gv', opts)

vim.keymap.set('i', ',', ',<C-g>u', opts)
vim.keymap.set('i', '.', '.<C-g>u', opts)
vim.keymap.set('i', '!', '!<C-g>u', opts)
vim.keymap.set('i', '?', '?<C-g>u', opts)
vim.keymap.set('i', '-', '-<C-g>u', opts)
vim.keymap.set('i', '_', '_<C-g>u', opts)

vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', opts)
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', opts)
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', opts)
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", opts)

-- thank you TJ https://github.com/tjdevries
vim.keymap.set({ 'i', 's' }, '<C-k>', function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })
vim.keymap.set({ 'i', 's' }, '<C-j>', function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })

vim.keymap.set('n', '<leader><space>', tl_builtin.buffers, opts)

vim.keymap.set('n', '<leader>bn', '<cmd>bn<CR>', opts)
vim.keymap.set('n', '<leader>bp', '<cmd>bp<CR>', opts)
vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>', opts)
vim.keymap.set('n', '<leader>bz', tl_builtin.current_buffer_fuzzy_find, opts)

vim.keymap.set('n', '<leader>sn', '<cmd>set relativenumber!<CR>', opts)
vim.keymap.set('n', '<leader>sw', '<cmd>set wrap!<CR>', opts)
vim.keymap.set('n', '<leader>ss', '<cmd>set spell!<CR>', opts)
vim.keymap.set('n', '<leader>sc', '<cmd>HexokinaseToggle<CR>', opts)
vim.keymap.set('n', '<leader>sl', '<cmd>IndentBlanklineToggle<CR>', opts)
vim.keymap.set('n', '<leader>sh', '<cmd>set list!<CR>', opts)

vim.keymap.set('n', '<leader>fs', '<cmd>write<CR>', opts)
vim.keymap.set('n', '<leader>ff', tl_builtin.find_files, opts)
vim.keymap.set('n', '<leader>fp', vim.lsp.buf.formatting, opts)
vim.keymap.set('v', '<leader>fp', vim.lsp.buf.range_formatting, opts)
vim.keymap.set('n', '<leader>fg', tl_builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fr', tl_builtin.registers, opts)
vim.keymap.set('n', '<leader>ft', '<cmd>TodoTelescope<CR>', opts)

vim.keymap.set('n', '<leader>oe', '<cmd>edit %:p:h<CR>', opts)
vim.keymap.set('n', '<leader>of', tl_ext.file_browser.file_browser, opts)
vim.keymap.set('n', '<leader>op', function()
    tl_ext.project.project({})
end, opts)
vim.keymap.set('n', '<leader>om', tl_ext.media_files.media_files, opts)
vim.keymap.set('n', '<leader>oE', tl_ext.env.env, opts)
vim.keymap.set('n', '<leader>ot', '<cmd>NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>on', '<cmd>ZkNotes<CR>', opts)
vim.keymap.set('n', '<leader>ou', '<cmd>UndotreeToggle<CR>', opts)

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, opts)
vim.keymap.set('n', '<F5>', dap.continue, opts)
vim.keymap.set('n', '<leader>dr', dap.run_last, opts)
vim.keymap.set('n', '<F6>', dap.step_over, opts)
vim.keymap.set('n', '<F7>', dap.step_into, opts)
vim.keymap.set('n', '<F8>', dap.step_out, opts)
vim.keymap.set('n', '<leader>dj', dap.run_to_cursor, opts)
vim.keymap.set('n', '<leader>du', require('dapui').toggle, opts)
vim.keymap.set('n', '<leader>dfp', tl_ext.dap.commands, opts)
vim.keymap.set('n', '<leader>dfb', tl_ext.dap.list_breakpoints, opts)
vim.keymap.set('n', '<leader>dfv', tl_ext.dap.variables, opts)
vim.keymap.set('n', '<leader>dff', tl_ext.dap.frames, opts)

vim.keymap.set('n', '<leader>gb', tl_builtin.git_branches, opts)
vim.keymap.set('n', '<leader>gh', tl_builtin.git_bcommits, opts)
vim.keymap.set('n', '<leader>gc', tl_builtin.git_commits, opts)
vim.keymap.set('n', '<leader>gs', '<cmd>vertical G<CR>', opts)
vim.keymap.set('n', '<leader>gw', '<cmd>vertical G blame<CR>', opts)
vim.keymap.set('n', '<leader>gl', '<cmd>vertical G log<CR>', opts)
