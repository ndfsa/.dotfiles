require('rest-nvim').setup({
    result_split_horizontal = false,
    skip_ssl_verification = false,
    highlight = {
        enabled = true,
        timeout = 150,
    },
    result = {
        show_url = true,
        show_http_info = true,
        show_headers = true,
    },
    jump_to_request = false,
    env_file = '.env',
    custom_dynamic_variables = {},
    yank_dry_run = true,
})

local opts = {noremap = false, silent = true}

vim.api.nvim_buf_set_keymap(0, 'n', '<leader>rh', '<Plug>RestNvim', opts)
