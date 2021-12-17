local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
return require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use {
		'ellisonleao/gruvbox.nvim',
		requires = {'rktjmp/lush.nvim'}
	}
	use 'szw/vim-maximizer'
	use 'norcalli/nvim-colorizer.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'
	use 'nathom/filetype.nvim'
	use {
		'monkoose/matchparen.nvim',
		config = function() require('matchparen').setup() end
	}
	use {
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	}
	use {
		'kristijanhusak/orgmode.nvim',
		config = function() require('orgmode-config') end
	}
	use {
		'akinsho/org-bullets.nvim',
		config = function() require('org-bullets').setup() end
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function() require('indent-blankline-config') end
	}
	use {
		'tamago324/lir.nvim',
		config = function() require('lir-config') end
	}
	use {
		'hoob3rt/lualine.nvim',
		config = function() require('lualine-config') end
	}
	use {
		'neovim/nvim-lspconfig',
		config = function () require('lsp-config') end
	}
	use 'nvim-treesitter/playground'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = 'TSUpdate',
		config = function() require('treesitter-config') end
	}
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'saadparwaiz1/cmp_luasnip',
		},
		config = function() require('cmp-config') end
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'plenary.nvim',
			'popup.nvim',
			'nvim-telescope/telescope-project.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				run = 'make'
			}
		},
		config = function() require('telescope-config') end
	}
	use {
		'windwp/nvim-autopairs',
		config = function() require('autopairs-config') end,
		after = 'nvim-cmp'
	}
	use {
		'sindrets/diffview.nvim',
		requires = 'plenary.nvim'
	}
	use {
		'TimUntersberger/neogit',
		requires = 'plenary.nvim',
		config = function() require('neogit-config') end
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns-config') end
	}
	use {
		'sQVe/sort.nvim',
		config = function() require('sort').setup() end
	}
	if packer_bootstrap then
		require('packer').sync()
	end
end)
