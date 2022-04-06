local map = vim.keymap.set
local tl_ext = require('telescope').extensions
local tl_builtin = require('telescope.builtin')
local luasnip = require('luasnip')
local dap = require('dap')

local key_opts = { remap = false, silent = true }
map('n', 'n', 'nzzzv', key_opts)
map('n', 'N', 'Nzzzv', key_opts)

map('v', '>', '>gv', key_opts)
map('v', '<', '<gv', key_opts)

map('i', ',', ',<C-g>u', key_opts)
map('i', '.', '.<C-g>u', key_opts)
map('i', '!', '!<C-g>u', key_opts)
map('i', '?', '?<C-g>u', key_opts)
map('i', '-', '-<C-g>u', key_opts)
map('i', '_', '_<C-g>u', key_opts)

map('n', '<A-j>', ':m .+1<CR>==', key_opts)
map('n', '<A-k>', ':m .-2<CR>==', key_opts)
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', key_opts)
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', key_opts)
map('v', '<A-j>', ':m \'>+1<CR>gv=gv', key_opts)
map('v', '<A-k>', ':m \'<-2<CR>gv=gv', key_opts)

-- thank you TJ https://github.com/tjdevries
map({ "i", "s" }, "<C-k>", function()
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    end
end, { silent = true })
map({ "i", "s" }, "<C-j>", function()
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    end
end, { silent = true })

map('n', '<leader><space>', tl_builtin.buffers, key_opts)

map('n', '<leader>bn', '<cmd>bn<CR>', key_opts)
map('n', '<leader>bp', '<cmd>bp<CR>', key_opts)
map('n', '<leader>bd', '<cmd>bd<CR>', key_opts)
map('n', '<leader>bz', tl_builtin.current_buffer_fuzzy_find, key_opts)

map('n', '<leader>sn', '<cmd>set relativenumber!<CR>', key_opts)
map('n', '<leader>sw', '<cmd>set wrap!<CR>', key_opts)
map('n', '<leader>ss', '<cmd>set spell!<CR>', key_opts)
map('n', '<leader>sc', '<cmd>HexokinaseToggle<CR>', key_opts)
map('n', '<leader>sl', '<cmd>IndentBlanklineToggle<CR>', key_opts)
map('n', '<leader>sh', '<cmd>set list!<CR>', key_opts)

map('n', '<leader>fs', '<cmd>write<CR>', key_opts)
map('n', '<leader>ff', tl_builtin.find_files, key_opts)
map('n', '<leader>fg', tl_builtin.live_grep, key_opts)
map('n', '<leader>fr', tl_builtin.registers, key_opts)
map('n', '<leader>ft', '<cmd>TodoTelescope<CR>', key_opts)

map('n', '<leader>oe', '<cmd>edit %:p:h<CR>', key_opts)
map('n', '<leader>of', tl_ext.file_browser.file_browser, key_opts)
map('n', '<leader>op', function() tl_ext.project.project({}) end, key_opts)
map('n', '<leader>om', tl_ext.media_files.media_files, key_opts)
map('n', '<leader>oE', tl_ext.env.env, key_opts)
map('n', '<leader>ot', '<cmd>NvimTreeToggle<CR>', key_opts)

map('n', '<leader>db', dap.toggle_breakpoint, key_opts)
map('n', '<F5>', dap.continue, key_opts)
map('n', '<leader>dr', dap.run_last, key_opts)
map('n', '<F6>', dap.step_over, key_opts)
map('n', '<F7>', dap.step_into, key_opts)
map('n', '<F8>', dap.step_out, key_opts)
map('n', '<leader>dj', dap.run_to_cursor, key_opts)
map('n', '<leader>du', require('dapui').toggle, key_opts)
map('n', '<leader>dfp', tl_ext.dap.commands, key_opts)
map('n', '<leader>dfb', tl_ext.dap.list_breakpoints, key_opts)
map('n', '<leader>dfv', tl_ext.dap.variables, key_opts)
map('n', '<leader>dff', tl_ext.dap.frames, key_opts)

map('n', '<leader>gb', tl_builtin.git_branches, key_opts)
map('n', '<leader>gh', tl_builtin.git_bcommits, key_opts)
map('n', '<leader>gc', tl_builtin.git_commits, key_opts)
map('n', '<leader>gs', '<cmd>vertical G<CR>', key_opts)
map('n', '<leader>gw', '<cmd>vertical G blame<CR>', key_opts)
map('n', '<leader>gl', '<cmd>vertical G log<CR>', key_opts)
