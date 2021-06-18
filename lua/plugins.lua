vim.cmd [[packadd packer.nvim]]
vim.cmd [[ autocmd bufwritepost plugins.lua PackerCompile ]]

return require('packer').startup(function()
	use {
		'wbthomason/packer.nvim', opt = true
	}
	
-- {{ keybinding stuff
	use {
		'folke/which-key.nvim',
		config = require("plugins._whichkey").config
	}
	use {
		'blackcauldron7/surround.nvim'
	}
	use { -- commenting 
		"terrortylor/nvim-comment",
		config = require("plugins._comment").config
	}
	use {
		"pianocomposer321/yabs.nvim"
	}
	use {
		"mhartington/formatter.nvim",
		config = require("plugins._formatter").config
	}
-- }}

-- {{ interface 
	use { -- colorscheme
		'savq/melange',
		config = require ("plugins._theme").config
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
		tree = 'lua',
		config = require ("plugins._indent").config
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
	use {
		'kevinhwang91/rnvimr',
		config = require("plugins._ranger").config
	}
	use { -- auto pairing
		"jiangmiao/auto-pairs"
	}
	use {
		'karb94/neoscroll.nvim'
	}
	use {
		"~/bin/FTerm.nvim"
	}
-- }}

-- {{ integration
--	use {
--		'vhyrro/neorg',
--		config = require("plugins._neorg").config
--	}
	use {
		'chrisbra/recover.vim'
	}
	use {
		'sindrets/diffview.nvim'
	}
	use { -- terminal in neovim
		"voldikss/vim-floaterm",
		config = require("plugins._floaterm").config
	}
	use {
		"pianocomposer321/consolation.nvim"
	}
	use {
		'kyazdani42/nvim-web-devicons'
	}
	use {
		'tpope/vim-dispatch'
	}
-- }}

-- {{ telescope
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

--{{ treesitter highlight
	use {
		"nvim-treesitter/nvim-treesitter",
		run = {
			':tsupdate',
			':tsinstall cpp'
		},
		config = require("plugins._treesitter").config
	}
	use {
		'p00f/nvim-ts-rainbow'
	}
-- }}

-- {{ neovim lsp
	use {
		'neovim/nvim-lspconfig',
		config = require("plugins._lsp").config
	}
	use {
		'ahmedkhalf/lsp-rooter.nvim'
	}
	use {
		'hrsh7th/nvim-compe',
		config = require("plugins._compe").config
	}
	use {
		'folke/todo-comments.nvim',
		requires = {
		'folke/trouble.nvim'
		},
		config = require("plugins._lsp-trouble").config
	}
	use {
		'rishabhrd/nvim-lsputils',
		requires = {
		'rishabhrd/popfix'
		},
		config = require("plugins._lsp-utils").config
	}
	use {
		'mfussenegger/nvim-jdtls'
		-- config = require("plugins._lsp").start_jdtls
	}
	use {
		'rcarriga/nvim-dap-ui',
		requires = {
		'mfussenegger/nvim-dap',
		'theHamsta/nvim-dap-virtual-text'
		},
		config = require("plugins._dap").config
	}
-- }}
--	use {
--		'folke/lsp-colors.nvim',
--		config = require("plugins._lsp-colors").config
--	}
--	use {
--		'oberblastmeister/neuron.nvim'
--	}
    -- Plug 'wincent/command-t'
	--use {'tibabit/vim-templates'}
	--	use {'npxbr/glow.nvim' ,'do': ':GlowInstall'}
    -- Plug 'vim-scripts/vim-auto-save'
    -- Plug 'prettier/vim-prettier'
    
  end)
