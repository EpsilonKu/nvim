
local M = {}

function M.config()
	require('spectre').setup({
		color_devicons = true,
		open_cmd = 'vnew',
		live_update = false, -- auto excute search again when you write any file in vim
		line_sep_start = '┌-----------------------------------------',
		result_padding = '¦  ',
		line_sep       = '└-----------------------------------------'
		})

end

return M

