local hexvalue = {
    function()
        return "0x%02B"
    end
}
local bufinfo = {
    function ()
        return "%n:%t%4m%5r%4w"
    end,
}
local filesize = {
    function ()
        local function format_file_size(file)
            local size = vim.fn.getfsize(file)
            if size <= 0 then return '' end
            local sufixes = {'B', 'KiB', 'MiB', 'GiB', 'TiB'}
            local i = 1
            while size > 1024 do
                size = size / 1024
                i = i + 1
            end
            return string.format('%.2f%s', size, sufixes[i])
        end
        local file = vim.fn.expand('%:p')
        if string.len(file) == 0 then return '' end
        return format_file_size(file)
    end,
    condition = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end
}
local diag = {
    'diagnostics',
    sources = {'nvim_diagnostic'},
    symbols = {error = ' ', warn = ' ', info = ' '},
}
local encoding = {
    'o:encoding',
    fmt = string.upper
}
local fileformat = {
    'fileformat',
    icons_enabled = false,
    fmt = string.upper
}

local lsp_name = {
    function()
        local msg = ''
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then return msg end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
}
local separator = {
    function() return '%=' end
}
require('lualine').setup({
    options = {
        theme = 'gruvbox',
        section_separators = ' ',
        component_separators = ' ',
        disabled_filetypes = {'packer', 'undotree', 'diff', 'qf'},
    },
    sections = {
        lualine_a = {
            'mode',
        },
        lualine_b = {
            filesize,
        },
        lualine_c = {
            bufinfo,
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
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {separator, filesize, bufinfo, 'filetype'},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
})
