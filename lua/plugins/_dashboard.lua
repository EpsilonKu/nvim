
local M = {}

function M.config()
	local g = vim.g
	vim.g.dashboard_default_executive = 'telescope'
	vim.g.dashboard_preview_command = 'cat'
	vim.g.dashboard_preview_pipeline = 'lolcat --spread=2.5 -t --seed=156'
	vim.g.dashboard_preview_file = '~/.config/nvim/etc/logo/girl.cat'
	vim.g.dashboard_preview_file_height = 14
	vim.g.dashboard_preview_file_width = 60
end

return M

