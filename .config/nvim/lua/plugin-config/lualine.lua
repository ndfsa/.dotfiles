local hexvalue = {
    function()
        return '0x%02B'
    end,
}
local diag = {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
}
local encoding = {
    'o:encoding',
    fmt = string.upper,
}
local fileformat = {
    'fileformat',
    icons_enabled = false,
    fmt = string.upper,
}

local lsp_name = {
    function()
        local msg = ''
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
}
local lir_ext = {
    sections = { lualine_a = {
        function()
            return vim.fn.expand('%:~')
        end,
    } },
    filetypes = { 'lir' },
}
require('lualine').setup({
    options = {
        theme = 'kanagawa',
        section_separators = ' ',
        component_separators = ' ',
        globalstatus = true,
    },
    sections = {
        lualine_a = {
            'mode',
        },
        lualine_b = {
            'filesize',
        },
        lualine_c = {
            'branch',
            'progress',
            diag,
        },
        lualine_x = {
            hexvalue,
            'location',
            lsp_name,
        },
        lualine_y = {
            'filetype',
            fileformat,
        },
        lualine_z = {
            encoding,
        },
    },
    extensions = { lir_ext, 'quickfix', 'fugitive', 'nvim-tree' },
})
