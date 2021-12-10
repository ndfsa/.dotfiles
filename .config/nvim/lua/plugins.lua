local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.api.nvim_command 'packadd packer.nvim'
end
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])
return require('packer').startup(function()
	use 'sainnhe/gruvbox-material'
	use 'wbthomason/packer.nvim'
	use 'szw/vim-maximizer'
	use 'norcalli/nvim-colorizer.lua'
	use 'kyazdani42/nvim-web-devicons'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'nacro90/numb.nvim'
	use 'plasticboy/vim-markdown'
	use 'ThePrimeagen/vim-be-good'
	use 'L3MON4D3/LuaSnip'
	use 'f-person/git-blame.nvim'
	use {
		'numToStr/Comment.nvim',
		config = function() require('Comment-config') end
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
		'lewis6991/gitsigns.nvim',
		requires = { 'plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}
	use {
		'tamago324/lir.nvim',
		config = function() require('lir-config') end
	}
	use {
		'mattn/emmet-vim',
		ft = {'html', 'css', 'javascript'},
		opt = true
	}
	use {
		'hoob3rt/lualine.nvim',
		config = function() require('lualine-config') end
	}
	use {
		'neovim/nvim-lspconfig',
		config = function () require('lsp-config') end
	}
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
			'saadparwaiz1/cmp_luasnip',
		},
		config = function() require('cmp-config') end
	}
	use 'nvim-telescope/telescope-project.nvim'
	use {
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'make'
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {'plenary.nvim', 'popup.nvim'},
		config = function() require('telescope-config') end
	}
	use {
		'windwp/nvim-autopairs',
		config = function() require('autopairs-config') end,
		after = 'nvim-cmp'
	}
	use {
		'lewis6991/spellsitter.nvim',
		ft = {'markdown', 'tex', 'text', 'org'},
		opt = true,
		config = function() require('spellsitter-config') end
	}
	use {
		'folke/which-key.nvim',
		config = function() require('which-key-config') end
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
end)
