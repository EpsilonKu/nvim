vim.cmd [[packadd packer.nvim]]
vim.cmd [[ autocmd bufwritepost plugins.lua PackerCompile ]]

return require("packer").startup(function()
    use {"wbthomason/packer.nvim", opt = true}

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
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            local cfg = {
                bind = true, -- This is mandatory, otherwise border config won't get registered.
                hint_prefix = "🐼 ",
                handler_opts = {border = "rounded"}
            } -- add you config here
            require"lsp_signature".setup(cfg)
        end
    }
    use {"tami5/lspsaga.nvim"}
    use {"nvim-lua/lsp-status.nvim"}
    use {"ahmedkhalf/project.nvim"}
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}
    use {"rafamadriz/friendly-snippets"}
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
        'rmagatti/auto-session',
        config = function() require("plugins.session") end
    }
    use {
        "nanotee/sqls.nvim",
        config = function()
            require('lspconfig').sqls.setup {
                on_attach = function(client, bufnr)
                    require('sqls').on_attach(client, bufnr)
                end
            }
        end
    }
    use {
        "rmagatti/session-lens",
        requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
        config = function()
            require('session-lens').setup({
                prompt_title = 'YEAH SESSIONS',
                path_display = {'shorten'},
                previewer = true
            })
        end
    }
    use {'ldelossa/litee.nvim'}
    use {'ldelossa/litee-filetree.nvim'}
    use {'ldelossa/litee-symboltree.nvim'}
    use {'ldelossa/litee-calltree.nvim'}
    use {
        'ldelossa/litee-bookmarks.nvim',
        config = function() require("plugins.litee") end
    }
    -- }}

    -- {{ interface
    use {
        "beauwilliams/focus.nvim",
        config = function() require("focus").setup() end
    }
    use {
        'https://gitlab.com/yorickpeterse/nvim-window.git',
        config = function()

            require('nvim-window').setup({
                -- The characters available for hinting windows.
                chars = {'a', 's', 'd', 'f', 'j', 'k', 'l', 'g', 'h'},

                -- A group to use for overwriting the Normal highlight group in the floating
                -- window. This can be used to change the background color.
                normal_hl = 'Normal',

                -- The highlight group to apply to the line that contains the hint characters.
                -- This is used to make them stand out more.
                hint_hl = 'Bold',

                -- The border style to use for the floating window.
                border = 'single'
            })
        end
    }
    use {
        "danymat/neogen",
        config = function() require('neogen').setup {enabled = true} end,
        requires = "nvim-treesitter/nvim-treesitter"
    }
    use {
        "nvim-neorg/neorg",
        setup = vim.cmd(
            "autocmd BufRead,BufNewFile *.norg setlocal filetype=norg"),
        after = {"nvim-treesitter"}, -- you may also specify telescope
        ft = "norg",
        config = function() require("plugins.neorg") end,
        requires = "nvim-lua/plenary.nvim"
    }

    use {
        "luukvbaal/stabilize.nvim",
        config = function() require("stabilize").setup() end
    }
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
        'numToStr/Navigator.nvim',
        config = function() require('Navigator').setup() end
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

end)
