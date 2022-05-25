-- basic config
require('basic')

-- load plugins
if not pcall(require, 'plugin-config') then
    print('error loading plugins')
end

local AUG = vim.api.nvim_create_augroup('convenient', {
    clear = true,
})
vim.api.nvim_create_autocmd('TextYankPost', {
    group = AUG,
    callback = function()
        vim.highlight.on_yank({
            higroup = 'Visual',
            timeout = 300,
        })
    end,
})
vim.api.nvim_create_autocmd('BufWritePost', {
    group = AUG,
    pattern = { '*/plugin-config/init.lua' },
    callback = function()
        vim.cmd('luafile %')
        require('packer').compile()
    end,
})
