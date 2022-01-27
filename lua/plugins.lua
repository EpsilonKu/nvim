vim.cmd [[packadd packer.nvim]]
vim.cmd [[ autocmd bufwritepost plugins.lua PackerCompile ]]

return require("packer").startup(
    function()
        use {
            "wbthomason/packer.nvim",
            opt = true
        }

        -- {{ keybinding stuff
        use {
            "folke/which-key.nvim",
            config = ("plugins._whichkey").config
        }
		use {
			"stevearc/dressing.nvim",
			config = function()
				
			end
		}
		use {
			"nanozuki/tabby.nvim",
            config = function()
                require("plugins._barbar")
            end
		}
		use {
			"max397574/better-escape.nvim",
			config = function()
-- lua, default settings
require("better_escape").setup {
    mapping = {"jj"}, -- a table with mappings to use
    timeout = 500, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
}
			end
		}
		use {
			"LinArcX/telescope-command-palette.nvim"
		}
        use {
            "blackcauldron7/surround.nvim",
            config = function()
                require "surround".setup {mappings_style = "sandwich"}
            end
        }
        -- use {
        --     -- commenting
        --     "terrortylor/nvim-comment",
        --     config = require("plugins._comment").config
        -- }
        use {
            "mhartington/formatter.nvim",
    	    config = require("plugins._formatter").config
        }
		use {
			"numToStr/Comment.nvim",
			config = function()
				require('Comment').setup()
			end
		}
        use {
            "gelguy/wilder.nvim",
            config = function()
                vim.cmd [[
	call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })

	call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
	  \ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
      \   'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#f4468f'}]),
      \ },
      \ 'min_width': '100%',
      \ 'min_height': '50%',
      \ 'reverse': 0,
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ })))

	]]
            end
        }
        use {
            "simrat39/symbols-outline.nvim"
        }
    --     use {
    --         "ldelossa/calltree.nvim",
    --         config = function()
				-- require('calltree').setup({})
    --         end
    --     }
        use {
            "folke/persistence.nvim",
            event = "BufReadPre", -- this will only start session saving when an actual file was opened
            module = "persistence",
            config = function()
                require("persistence").setup(
                    {
                        dir = vim.fn.expand(vim.fn.stdpath("config") .. "/sessions/"), -- directory where session files are saved
                        options = {"buffers", "curdir", "tabpages"} -- sessionoptions used for saving
                    }
                )
            end
        }
        -- }}

        -- {{ interface
        use {
            -- colorscheme
            "savq/melange",
            config = require("plugins._theme").config,
			requires = {
            	"rktjmp/lush.nvim"
			}	
        }
        use {
            "andweeb/presence.nvim",
            config = function()
                -- The setup config table shows all available config options with their default values:
                require("presence"):setup({})
            end
        }
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("plugins._indent")
            end
        }
        use {
            -- status line
            "nvim-lualine/lualine.nvim",
            config = require("plugins._lualine").config
        }
        use {
            -- starting screen
            "goolord/alpha-nvim",
            config = function()
                require("plugins._dashboard")
            end
        }
        -- use {
        --     "akinsho/bufferline.nvim",
        --     requires = "kyazdani42/nvim-web-devicons",
        --     config = function()
        --         require("plugins._barbar")
        --     end
        -- }
        -- use {
        -- "sidebar-nvim/sidebar.nvim",
        -- rocks = {"luatz"},
        -- config = require("plugins._navigator").config
        -- }
        use {
            "kyazdani42/nvim-tree.lua",
            config = function()
                require("plugins._tree")
            end
        }
        -- use {
        --     "kevinhwang91/rnvimr",
        --     config = require("plugins._ranger").config
        -- }
        use {
            -- auto pairing
            "windwp/nvim-autopairs"
        }
        use {
            "windwp/nvim-ts-autotag"
        }
        -- use {
        --     "karb94/neoscroll.nvim"
        -- }
        use {
            "epsilonku/fterm.nvim"
        }
        use {
            "windwp/nvim-spectre",
            config = require("plugins._spectre").config,
            require = {
                "nvim-lua/plenary.nvim"
            }
        }
        -- }}

        -- {{ integration
        --	use {
        --		'vhyrro/neorg',
        --		config = require("plugins._neorg").config
        --	}
        use {
            "chrisbra/recover.vim"
        }
        use {
            "lambdalisue/suda.vim"
        }
        use {
            "sindrets/diffview.nvim"
        }
        use {
            -- terminal in neovim
            "voldikss/vim-floaterm",
            config = require("plugins._floaterm").config
        }
        -- use {
        -- 	'weilbith/nvim-floating-tag-preview',
        -- 	config = function()
        --
        -- 	end,
        -- 	cmd = {'Ptag', 'Ptselect', 'Ptjump', 'Psearch', 'Pedit' },
        -- }
        -- use {
        --     "pianocomposer321/consolation.nvim"
        -- }
        use {
            "kyazdani42/nvim-web-devicons"
        }
        -- }}

        -- {{ telescope
        use {
            -- file finder
            "nvim-telescope/telescope.nvim",
            requires = {
                {
                    "nvim-lua/popup.nvim"
                },
                {
                    "nvim-lua/plenary.nvim"
                }
            },
            config = function()
                require("plugins._telescope")
            end
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
                ":TSUpdate"
            },
            config = require("plugins._treesitter").config
        }
        use {
            "p00f/nvim-ts-rainbow"
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
            "neovim/nvim-lspconfig",
            config = function()
                require("plugins._lsp")
            end
        }
        use {
            "tjdevries/nlua.nvim"
        }
        use {
            "onsails/lspkind-nvim"
        }
        use {
            "ray-x/lsp_signature.nvim"
        }
        use {
            "tami5/lspsaga.nvim",
        }
        use {
            "nvim-lua/lsp-status.nvim"
        }
        use {
            "ahmedkhalf/project.nvim"
        }
        use {
            "hrsh7th/cmp-nvim-lsp"
        }
        use {
            "hrsh7th/cmp-path",
            after = "nvim-cmp"
        }
        use {
            "hrsh7th/cmp-buffer",
            after = "nvim-cmp"
        }
        use {
            "hrsh7th/nvim-cmp",
            config = function()
                -- your config
                require("plugins._compe")
            end
        }

        use {
            "folke/todo-comments.nvim",
            requires = {
                "folke/trouble.nvim"
            },
            config = require("plugins._lsp-trouble").config
        }
        use {
            "mfussenegger/nvim-jdtls"
        }
        use {
            "rcarriga/nvim-dap-ui",
            requires = {
                "mfussenegger/nvim-dap",
                "theHamsta/nvim-dap-virtual-text",
                "nvim-telescope/telescope-dap.nvim"
            },
            config = function()
                require("plugins._dap")
            end
        }
        -- }}
    end
)
