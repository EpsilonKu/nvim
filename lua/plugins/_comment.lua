
local M = {}

function M.config()
	local g = vim.g
	require('nvim_comment').setup({
		-- Should key mappings be created
		create_mappings = true,
	})
end

return M

