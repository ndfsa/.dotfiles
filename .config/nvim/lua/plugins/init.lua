local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    })
end
return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use('sainnhe/gruvbox-material')
    use('kyazdani42/nvim-web-devicons')
    use({
        'monkoose/matchparen.nvim',
        config = function()
            require('matchparen').setup()
        end,
    })
    use({
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end,
    })
    use({
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('plugins.indent-blankline-config')
        end,
    })
    use({
        'tamago324/lir.nvim',
        config = function()
            require('plugins.lir-config')
        end,
    })
    use({
        'nvim-lualine/lualine.nvim',
        config = function()
            require('plugins.lualine-config')
        end,
    })
    use({
        'neovim/nvim-lspconfig',
        config = function()
            require('plugins.lsp-config')
        end,
    })
    use('nvim-treesitter/playground')
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('plugins.treesitter-config')
        end,
    })
    use({
        'L3MON4D3/LuaSnip',
        requires = 'rafamadriz/friendly-snippets',
        config = function()
            require('plugins.luasnip-config')
        end,
    })
    use({
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',
            'onsails/lspkind-nvim',
        },
        config = function()
            require('plugins.cmp-config')
        end,
    })
    use({
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
            'nvim-telescope/telescope-project.nvim',
            'nvim-telescope/telescope-media-files.nvim',
            'LinArcX/telescope-env.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make',
            },
            'nvim-telescope/telescope-dap.nvim',
        },
        config = function()
            require('plugins.telescope-config')
        end,
    })
    use({
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
    })
    use({
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('plugins.gitsigns-config')
        end,
    })
    use({
        'sQVe/sort.nvim',
        config = function()
            require('sort').setup()
        end,
    })
    use({
        'anuvyklack/pretty-fold.nvim',
        config = function()
            require('pretty-fold').setup({})
        end,
    })
    use('tpope/vim-fugitive')
    use('machakann/vim-sandwich')
    use({
        'RRethy/vim-hexokinase',
        run = 'make hexokinase',
    })
    use('tweekmonster/startuptime.vim')
    use({
        'folke/todo-comments.nvim',
        config = function()
            require('todo-comments').setup()
        end,
        requires = { 'nvim-lua/plenary.nvim' },
    })
    use({
        'rcarriga/nvim-dap-ui',
        requires = {
            {
                'mfussenegger/nvim-dap',
                config = function()
                    require('plugins.nvim-dap-config')
                end,
            },
        },
        config = function()
            require('dapui').setup()
        end,
    })
    use({
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('plugins.nvim-tree-config')
        end,
    })
    use({
        'mickael-menu/zk-nvim',
        config = function()
            require('plugins.zk-config')
        end,
    })
    use({
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('plugins.null-ls-config')
        end,
        requires = { 'nvim-lua/plenary.nvim' },
    })
    use({
        'nmac427/guess-indent.nvim',
        config = function()
            require('guess-indent').setup()
        end,
    })
    if packer_bootstrap then
        require('packer').sync()
    end
end)
