
local M = {}

function M.config()
	local g = vim.g
	vim.g.dashboard_default_executive = 'telescope'
	vim.g.dashboard_preview_command = 'cat'
	vim.g.dashboard_preview_pipeline = 'lolcat --spread=2.5 -t --seed=156'
	vim.g.dashboard_preview_file = '~/.config/nvim/etc/logo/sus.cat'
	vim.g.dashboard_preview_file_height = 21
	vim.g.dashboard_preview_file_width = 30

	vim.g.dashboard_custom_shortcut={
		last_session       = 'SPC s l',
		find_history       = 'SPC f h',
		find_file          = 'SPC f f',
		change_colorscheme = 'SPC t c',
		new_file           = 'SPC c n',
		find_word          = 'SPC f a',
		book_marks         = 'SPC f b',
		}

end

return M

