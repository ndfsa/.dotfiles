require('gitsigns').setup({
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', ']c', function()
            if vim.wo.diff then
                return ']c'
            end
            vim.schedule(function()
                gs.next_hunk()
            end)
            return '<Ignore>'
        end, { expr = true })

        map('n', '[c', function()
            if vim.wo.diff then
                return '[c'
            end
            vim.schedule(function()
                gs.prev_hunk()
            end)
            return '<Ignore>'
        end, { expr = true })

        map({ 'n', 'v' }, '<leader>ghs', ':Gitsigns stage_hunk<CR>')
        map({ 'n', 'v' }, '<leader>ghr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>gR', gs.reset_buffer)
        map('n', '<leader>gw', function()
            gs.blame_line({ full = true })
        end)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end,
})
