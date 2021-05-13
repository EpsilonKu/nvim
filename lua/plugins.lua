vim.cmd [[packadd packer.nvim]]

vim.cmd [[ autocmd BufWritePost plugins.lua PackerCompile ]]

return require('packer').startup(function()
	use {
		'wbthomason/packer.nvim', opt = true
	}
	
-- {{ KeyBinding Stuff
	use {
		'blackcauldron7/surround.nvim'
	}
	use { -- fast commenting 
		"terrortylor/nvim-comment",
		config = require("plugins._comment").config
	}
-- }}

-- {{ Interface 
	use { -- colorscheme
		'savq/melange',
		config = require ("plugins._theme").config
	}
	use { -- status line
		'hoob3rt/lualine.nvim',
		config = require ("plugins._lualine").config
	}
	use { -- starting screen
		'glepnir/dashboard-nvim',
		config = require("plugins._dashboard").config
	}
	use {
		'romgrk/barbar.nvim',
		config = require("plugins._barbar").config
	}
	use {
		'kyazdani42/nvim-tree.lua',
		config = require("plugins._tree").config
	}
	use { -- auto pairing
		"jiangmiao/auto-pairs"
	}
	use {
		'karb94/neoscroll.nvim'
	}
-- }}

-- {{ Integration
	use {
		'vhyrro/neorg',
		config = require("plugins._neorg").config
	}
	use {
		'sindrets/diffview.nvim'
	}
	use { -- terminal in neovim
		"voldikss/vim-floaterm",
		config = require("plugins._floaterm").config
	}
	use {
		'kyazdani42/nvim-web-devicons'
	}
-- }}

-- {{ Telescope
	use { -- file finder
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
			"nvim-telescope/telescope-fzy-native.nvim",
			requires = {"romgrk/fzy-lua-native"}
	}
-- }}

--{{ Treesitter highlight
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
-- }}

-- {{ Neovim LSP
	use {
		'neovim/nvim-lspconfig',
		config = require("plugins._lsp").config
	}
	use {
		'hrsh7th/nvim-compe',
		config = require("plugins._compe").config
	}
	use {
		'folke/lsp-trouble.nvim',
		config = require("plugins._lsp-trouble").config
	}
-- }}

--	use {
--		'rishabhrd/nvim-lsputils',
--		requires = {
--			'rishabhrd/popfix'
--		},
--		config = require("plugins._lsp-utils").config
--	}
--	use {
--		'folke/lsp-colors.nvim',
--		config = require("plugins._lsp-colors").config
--	}
--	use {
--		'oberblastmeister/neuron.nvim'
--	}
--	use {
--		'jubnzv/virtual-types.nvim',
--		config = require("plugins._lsp-virtual").config
--	}
    -- Plug 'wincent/command-t'
--    use {'tibabit/vim-templates'}
--	use {'npxbr/glow.nvim' ,'do': ':GlowInstall'}
    -- Plug 'vim-scripts/vim-auto-save'
    -- Plug 'prettier/vim-prettier'
    
  end)
