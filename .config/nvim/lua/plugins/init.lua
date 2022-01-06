local M = {}

function M.init()
	local packer = nil

	packer = require('packer')
	packer.init({
		display = {
			open_fn = function()
				return require("packer.util").float { border = "rounded" }
			end,
		},
	})

	local use = packer.use
	packer.reset()

	use 'wbthomason/packer.nvim'
	use {
		'ellisonleao/gruvbox.nvim',
		requires = {'rktjmp/lush.nvim'}
	}
	use 'szw/vim-maximizer'
	use 'norcalli/nvim-colorizer.lua'
	use 'kyazdani42/nvim-web-devicons'
	use {
		'nathom/filetype.nvim',
		config = function() require('plugins.filetype-config') end
	}
	use {
		'monkoose/matchparen.nvim',
		config = function() require('matchparen').setup() end
	}
	use {
		'numToStr/Comment.nvim',
		config = function() require('Comment').setup() end
	}
	use {
		'akinsho/org-bullets.nvim',
		config = function() require('org-bullets').setup() end
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function() require('plugins.indent-blankline-config') end
	}
	use {
		'tamago324/lir.nvim',
		config = function() require('plugins.lir-config') end
	}
	use {
		'hoob3rt/lualine.nvim',
		config = function() require('plugins.lualine-config') end
	}
	use {
		'neovim/nvim-lspconfig',
		config = function () require('plugins.lsp-config') end
	}
	use 'nvim-treesitter/playground'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		config = function() require('plugins.treesitter-config') end
	}
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'saadparwaiz1/cmp_luasnip',
			'onsails/lspkind-nvim'
		},
		config = function() require('plugins.cmp-config') end
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-lua/popup.nvim',
			'nvim-telescope/telescope-file-browser.nvim',
			'nvim-telescope/telescope-project.nvim',
			'nvim-telescope/telescope-media-files.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				run = 'make'
			}
		},
		config = function() require('plugins.telescope-config') end
	}
	use {
		'windwp/nvim-autopairs',
		config = function() require('nvim-autopairs').setup() end
	}
	use {
		'sindrets/diffview.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}
	use {
		'TimUntersberger/neogit',
		requires = 'nvim-lua/plenary.nvim',
		config = function() require('plugins.neogit-config') end
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('plugins.gitsigns-config') end
	}
	use {
		'sQVe/sort.nvim',
		config = function() require('sort').setup() end
	}
	use {
		'folke/which-key.nvim',
		config = function () require('plugins.which-key-config') end
	}
	use {
		'NTBBloodbath/rest.nvim',
		ft = {'http'},
		config = function() require('plugins.rest-config') end
	}
	use {
		'rcarriga/nvim-dap-ui',
		requires = {
			{
				'mfussenegger/nvim-dap',
				config = function() require('plugins.nvim-dap-config') end
			}
		},
		config = function () require('dapui').setup() end
	}
	-- use {
	-- 	'anuvyklack/pretty-fold.nvim',
	-- 	config = function() require('pretty-fold').setup{} end
	-- }
end

return M
