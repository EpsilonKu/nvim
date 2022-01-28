vim.cmd [[packadd packer.nvim]]
vim.cmd [[ autocmd bufwritepost plugins.lua PackerCompile ]]

return require("packer").startup(function()
    use {"wbthomason/packer.nvim", opt = true}

    -- {{ keybinding stuff
    use {
        "folke/which-key.nvim",
        config = function() require("plugins.whichkey") end
    }
    use {"stevearc/dressing.nvim", config = function() end}
    use {
        "nanozuki/tabby.nvim",
        config = function() require("plugins.tabby") end
    }
    use {
        "max397574/better-escape.nvim",
        config = function()
            -- lua, default settings
            require("better_escape").setup {
                mapping = {"jj"}, -- a table with mappings to use
                timeout = 500, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
                clear_empty_lines = false, -- clear line after escaping if there is only whitespace
                keys = "<Esc>" -- keys used for escaping, if it is a function will use the result everytime
            }
        end
    }
    use {
        "blackcauldron7/surround.nvim",
        config = function()
            require"surround".setup {mappings_style = "sandwich"}
        end
    }
    use {
        "numToStr/Comment.nvim",
        config = function() require('Comment').setup() end
    }
    use {"sbdchd/neoformat", config = function() end}
    use {
        "gelguy/wilder.nvim",
        config = function() require("plugins.wilder") end
    }
    use {"simrat39/symbols-outline.nvim"}
    use {
        "shatur/neovim-session-manager",
        config = function() require("plugins.session-manager") end,
        requires = {"nvim-lua/plenary.nvim"}
    }
    use {
        'ldelossa/litee-calltree.nvim',
        config = function() require("plugins.litee") end,
        requires = {"ldelossa/litee.nvim"}
    }
    -- }}

    -- {{ interface
    use {
        -- colorscheme
        "savq/melange",
        config = function() require("plugins.theme") end,
        requires = {"rktjmp/lush.nvim"}
    }
    use {
        "andweeb/presence.nvim",
        config = function() require("presence"):setup({}) end
    }
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function() require("plugins.indent") end
    }
    use {
        -- status line
        "nvim-lualine/lualine.nvim",
        config = require("plugins.lualine").config
    }
    use {
        -- starting screen
        "goolord/alpha-nvim",
        config = function() require("plugins.alpha") end
    }
    -- use {
    -- "sidebar-nvim/sidebar.nvim",
    -- rocks = {"luatz"},
    -- config = require("plugins._navigator").config
    -- }
    use {
        "kyazdani42/nvim-tree.lua",
        config = function() require("plugins.tree") end
    }
    -- use {
    --     "kevinhwang91/rnvimr",
    --     config = require("plugins._ranger").config
    -- }
    use {
        -- auto pairing
        "windwp/nvim-autopairs"
    }
    use {"windwp/nvim-ts-autotag"}
    -- use {
    --     "karb94/neoscroll.nvim"
    -- }
    use {"epsilonku/fterm.nvim"}
    use {
        "windwp/nvim-spectre",
        config = require("plugins.spectre").config,
        require = {"nvim-lua/plenary.nvim"}
    }
    -- }}

    -- {{ integration
    -- use {
    -- 	'vhyrro/neorg',
    -- 	config = require("plugins.neorg").config
    -- }
    use {"sindrets/diffview.nvim"}
    use {
        -- terminal in neovim
        "voldikss/vim-floaterm",
        config = require("plugins.floaterm").config
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
    use {"kyazdani42/nvim-web-devicons"}
    -- }}

    -- {{ telescope
    use {
        -- file finder
        "nvim-telescope/telescope.nvim",
        requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
        config = function() require("plugins.telescope") end
    }
    use {"LinArcX/telescope-command-palette.nvim"}
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            {'nvim-telescope/telescope.nvim'},
            {'tami5/sqlite.lua', module = 'sqlite'}
        },
        config = function()
            require('neoclip').setup({enable_persistant_history = false})
        end
    }
    use {
        "nvim-telescope/telescope-frecency.nvim",
        config = function() require"telescope".load_extension("frecency") end,
        requires = {"tami5/sqlite.lua"}
    }
    -- }}

    -- {{ treesitter highlight
    use {
        "nvim-treesitter/nvim-treesitter",
        run = {":TSUpdate"},
        config = require("plugins.treesitter").config
    }
    use {"p00f/nvim-ts-rainbow"}
    use {"SmiteshP/nvim-gps"}
    use {"David-Kunz/treesitter-unit"}
    -- }}

    -- {{ neovim lsp
    use {
        "neovim/nvim-lspconfig",
        config = function()
            require("plugins.lsp.lsp")
            require("plugins.lsp.servers")
        end
    }
    use {"tjdevries/nlua.nvim"}
    use {"onsails/lspkind-nvim"}
    use {"ray-x/lsp_signature.nvim"}
    use {"tami5/lspsaga.nvim"}
    use {"nvim-lua/lsp-status.nvim"}
    use {"ahmedkhalf/project.nvim"}
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"hrsh7th/cmp-path", after = "nvim-cmp"}
    use {"hrsh7th/cmp-buffer", after = "nvim-cmp"}
    use {
        "hrsh7th/nvim-cmp",
        config = function()
            -- your config
            require("plugins.cmp")
        end
    }

    use {
        "folke/trouble.nvim",
        config = function() require("plugins.trouble") end
    }
    use {
        "folke/todo-comments.nvim",
        requires = {"folke/trouble.nvim"},
        config = function() require("plugins.todo-comments") end
    }
    use {"mfussenegger/nvim-jdtls"}
    use {
        "rcarriga/nvim-dap-ui",
        requires = {
            "mfussenegger/nvim-dap", "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope-dap.nvim"
        },
        config = function() require("plugins.dap") end
    }
    -- }}
end)
