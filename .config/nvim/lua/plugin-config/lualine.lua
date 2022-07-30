local filename = {
    function()
        return '%=%n:%t%4m%5r%4w%='
    end,
}
vim.opt.winbar = filename[1]()
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
local lir_ext = {
    sections = {
        lualine_c = {
            function()
                return vim.fn.expand('%:~')
            end,
        },
    },
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
            encoding,
        },
        lualine_y = {
            'filetype',
        },
        lualine_z = {
            fileformat,
        },
    },
    -- winbar = {
    --     lualine_b = { filename },
    -- },
    extensions = { lir_ext, 'quickfix', 'fugitive', 'nvim-tree' },
})
