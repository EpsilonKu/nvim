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
	use {
		"sbdchd/neoformat"
	}
-- }}

-- {{ interface 
	use { -- colorscheme
		'folke/tokyonight.nvim',
		config = require ("plugins._theme").config
	}
	use {
		'lukas-reineke/indent-blankline.nvim',
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
		"windwp/nvim-autopairs"
	}
	use {
		"windwp/nvim-ts-autotag"
	}
	use {
		'karb94/neoscroll.nvim'
	}
	use {
		"epsilonku/fterm.nvim"
	}
	use {
		"windwp/nvim-spectre",
		config = require("plugins._spectre").config
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
			':TSUpdate'
		},
		config = require("plugins._treesitter").config
	}
	use {
		'p00f/nvim-ts-rainbow'
	}
use {
	"SmiteshP/nvim-gps"
}
use {
	"David-Kunz/treesitter-unit"
}
-- }}

-- {{ neovim lsp
	use {
		'neovim/nvim-lspconfig',
		config = require("plugins._lsp").config
	}
	use {
		"onsails/lspkind-nvim",
	}
	use {
		'ray-x/lsp_signature.nvim'
	}
	use {
		'glepnir/lspsaga.nvim'
	}
	-- use {'ray-x/navigator.lua', 
	-- 	requires = {
	-- 		'ray-x/guihua.lua', 
	-- 		run = 'cd lua/fzy && make'
	-- 	},
	-- 	config = require("plugins._navigator").config
	-- }
	use {
		'nvim-lua/lsp-status.nvim'
	}
	use {
		'ahmedkhalf/project.nvim'
	}
	use {
		'hrsh7th/nvim-cmp',
		requires = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/vim-vsnip",
		"hrsh7th/cmp-buffer",
		},
		config = function()
			require("plugins._compe")
		end
	}
	use {
		'folke/todo-comments.nvim',
		requires = {
		'folke/trouble.nvim'
		},
		config = require("plugins._lsp-trouble").config
	}
	-- use {
	-- 	'rishabhrd/nvim-lsputils',
	-- 	requires = {
	-- 	'rishabhrd/popfix'
	-- 	},
	-- 	config = require("plugins._lsp-utils").config
	-- }
	use {
		'mfussenegger/nvim-jdtls'
	}
	use {
		'rcarriga/nvim-dap-ui',
		requires = {
		'mfussenegger/nvim-dap',
		'theHamsta/nvim-dap-virtual-text',
		'nvim-telescope/telescope-dap.nvim'
		},
		config = require("plugins._dap").config
	}
-- }}
    
  end)
