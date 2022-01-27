
local M = {}

function M.config()
	local g = vim.g
	 require("which-key").setup {
		icons = {
			breadcrumb = "", -- symbol used in the command line area that shows your active key combo
			separator = "", -- symbol used between a key and it's label
			group = "祐", -- symbol prepended to a group
		},
	}
end

return M

