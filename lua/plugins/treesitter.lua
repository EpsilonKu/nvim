local M = {}

function M.config()
    -- local U = require "utils"
    local g = vim.g
	require'nvim-treesitter.configs'.setup {
		ensure_installed = "maintained",
		rainbow = {
			enable = true
		},
		highlight = {
			enable = true,
			disable = {}
		},
		indent = {
			enable = true,
		}
	}
	require('nvim-ts-autotag').setup()
end
return M
