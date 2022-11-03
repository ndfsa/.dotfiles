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
        'rebelot/kanagawa.nvim',
        config = function()
            require('plugin-config.kanagawa')
        end,
    })
    use('kyazdani42/nvim-web-devicons')
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
        'L3MON4D3/LuaSnip',
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
            'nvim-telescope/telescope-symbols.nvim',
            'LinArcX/telescope-env.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make',
            },
        },
        config = function()
            require('plugin-config.telescope')
        end,
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
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup({})
        end,
    })
    use({
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('plugin-config.nvim-colorizer')
        end,
    })
    use('tweekmonster/startuptime.vim')
    use({
        'monkoose/matchparen.nvim',
        config = function()
            require('matchparen').setup({})
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
    use({
        'ThePrimeagen/harpoon',
        config = function()
            require('plugin-config.harpoon')
        end,
    })
    use({
        'https://gitlab.com/yorickpeterse/nvim-pqf.git',
        config = function()
            require('pqf').setup()
        end,
    })
    if packer_bootstrap then
        require('packer').sync()
    end
end)
