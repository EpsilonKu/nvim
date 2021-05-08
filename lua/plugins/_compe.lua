
local M = {}

function M.config()
	local g = vim.g
	require'compe'.setup({
	enabled = true,
	source = {
		path = true,
		buffer = true,
		nvim_lsp = true,
	},
	})
end

return M

