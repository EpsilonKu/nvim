
vim.cmd [[packadd packer.nvim]]

vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup(function()
	use {'wbthomason/packer.nvim', opt = true}

	use {'blackcauldron7/surround.nvim'}
	
	use {
		'savq/melange',
		config = require ("plugins._theme").config
	}

	use {
		'hoob3rt/lualine.nvim',
		config = require ("plugins._lualine").config
	}
	-- use {
	-- 	"mhinz/vim-startify",
	-- 	config = require("plugins._startify").config
	-- }
	use {
		'glepnir/dashboard-nvim',
		config = require("plugins._dashboard").config
	}
	use {
		"voldikss/vim-floaterm",
		config = require("plugins._floaterm").config
	}
	use {
		"terrortylor/nvim-comment",
		config = require("plugins._comment").config
	}
	use {
		"jiangmiao/auto-pairs"
	}
	-- use {
	-- 	"neoclide/coc.nvim",
	-- 	branch = "release",
	-- 	config = require("plugins._coc").config
	-- }
	use {
		"nvim-telescope/telescope.nvim",
		requires = {
			{
				'nvim-lua/popup.nvim'
			}, 
			{
				'nvim-lua/plenary.nvim'
			}
		},
		config = require("plugins._telescope").config
	}
	use {
		'oberblastmeister/neuron.nvim'
	}
	use {
		'vhyrro/neorg',
		config = require("plugins._neorg").config
	}
	use {
			"nvim-telescope/telescope-fzy-native.nvim",
			requires = {"romgrk/fzy-lua-native"}
    }
	use {
		'kyazdani42/nvim-web-devicons'
	}
	use {
		'romgrk/barbar.nvim',
		config = require("plugins._barbar").config
	}
	use {
		'kyazdani42/nvim-tree.lua',
		config = require("plugins._tree").config
	}
	use {
		'karb94/neoscroll.nvim'
	}
	use {
		"nvim-treesitter/nvim-treesitter",
		run = {
			':TSUpdate',
			':TSInstall cpp'
		},
		config = require("plugins._treesitter").config
	}
	use {
		'p00f/nvim-ts-rainbow'
	}
	-- use {
	-- 	"folke/which-key.nvim"
	-- }
	use {
		'sindrets/diffview.nvim'
	}
	use {
		'neovim/nvim-lspconfig',
		config = require("plugins._lsp").config
	}
	use {
		'hrsh7th/nvim-compe',
		config = require("plugins._compe").config
	}
	use {
		'rishabhrd/nvim-lsputils',
		requires = {
			'rishabhrd/popfix'
		},
		config = require("plugins._lsp-utils").config
	}
	use {
		'folke/lsp-colors.nvim',
		config = require("plugins._lsp-colors").config
	}
	use {
		'folke/lsp-trouble.nvim',
		config = require("plugins._lsp-trouble").config
	}
	use {
		'jubnzv/virtual-types.nvim',
		config = require("plugins._lsp-virtual").config
	}
    -- Plug 'wincent/command-t'
--    use {'tibabit/vim-templates'}
--	use {'npxbr/glow.nvim' ,'do': ':GlowInstall'}
    --  use {'wellle/context.vim'}
    -- Plug 'prabirshrestha/vim-lsp'
    -- Plug 'mattn/vim-lsp-settings'
    -- Plug 'vim-scripts/vim-auto-save'
    -- Plug 'prabirshrestha/asyncomplete.vim'
    -- Plug 'prabirshrestha/asyncomplete-lsp.vim'
    -- Plug 'prettier/vim-prettier'
    -- Plug 'ctrlpvim/ctrlp.vim'
    -- Plug 'knubie/vim-kitty-navigator'
    
  end)
