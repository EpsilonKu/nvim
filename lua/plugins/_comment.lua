
local M = {}

function M.config()
	local g = vim.g
	require('nvim_comment').setup({
		line_mapping = "gcc",
		operator_mapping = "gc"
	})
end

return M

