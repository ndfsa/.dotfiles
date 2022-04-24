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
    use({
        'ellisonleao/gruvbox.nvim',
        setup = function()
            require('plugin-config.gruvbox').pre()
        end,
        config = function()
            require('plugin-config.gruvbox').setup()
        end,
    })
    use({
        'TimUntersberger/neogit',
        config = function()
            require('plugin-config.neogit')
        end,
    })
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
            require('plugin-config.indent-blankline')
        end,
    })
    use({
        'tamago324/lir.nvim',
        config = function()
            require('plugin-config.lir')
        end,
    })
    use({
        'nvim-lualine/lualine.nvim',
        config = function()
            require('plugin-config.lualine')
        end,
    })
    use({
        'neovim/nvim-lspconfig',
        config = function()
            require('plugin-config.lspconfig')
        end,
    })
    use('nvim-treesitter/playground')
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('plugin-config.treesitter')
        end,
    })
    use({
        'lewis6991/spellsitter.nvim',
        config = function()
            require('spellsitter').setup()
        end,
    })
    use({
        'L3MON4D3/LuaSnip',
        requires = 'rafamadriz/friendly-snippets',
        config = function()
            require('plugin-config.luasnip')
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
            require('plugin-config.cmp')
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
            require('plugin-config.telescope')
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
            require('plugin-config.gitsigns')
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
    use({
        'tpope/vim-fugitive',
        setup = function()
            require('plugin-config.vim-fugitive')
        end,
    })
    use('machakann/vim-sandwich')
    use({
        'RRethy/vim-hexokinase',
        run = 'make hexokinase',
        setup = function()
            require('plugin-config.hexokinase')
        end,
    })
    use('tweekmonster/startuptime.vim')
    use({
        'rcarriga/nvim-dap-ui',
        requires = {
            'mfussenegger/nvim-dap',
            config = function()
                require('plugin-config.nvim-dap')
            end,
        },
        config = function()
            require('plugin-config.nvim-dap-ui')
        end,
    })
    use({
        'kyazdani42/nvim-tree.lua',
        config = function()
            require('plugin-config.nvim-tree')
        end,
    })
    use({
        'mickael-menu/zk-nvim',
        config = function()
            require('plugin-config.zk')
        end,
    })
    use({
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
            require('plugin-config.null-ls')
        end,
        requires = { 'nvim-lua/plenary.nvim' },
    })
    use({
        'nmac427/guess-indent.nvim',
        config = function()
            require('guess-indent').setup({ autocmd = false })
        end,
    })
    use({
        'NTBBloodbath/rest.nvim',
        config = function()
            require('plugin-config.rest')
        end,
    })
    use('kdheepak/lazygit.nvim')
    use({
        'mbbill/undotree',
        setup = function()
            require('plugin-config.undotree')
        end,
    })
    use({
        'gpanders/editorconfig.nvim',
        cond = function()
            vim.fn.filereadable('.editorconfig')
        end,
    })
    if packer_bootstrap then
        require('packer').sync()
    end
end)
