
local M = {}

function M.config()
	local g = vim.g
	vim.g.dashboard_default_executive = 'telescope'
	vim.g.dashboard_preview_command = 'cat'
	vim.g.dashboard_preview_pipeline = 'lolcat --spread=2.5 -t --seed=156'
	vim.g.dashboard_preview_file = '~/.config/nvim/logo/girl.cat'
	vim.g.dashboard_preview_file_height = 16
	vim.g.dashboard_preview_file_width = 80
	-- vim.g.dashboard_custom_header = {
	--                  "        .            .        ⣿⡇⣿⣿⣿⠛⠁⣴⣿⡿⠿⠧⠹⠿⠘⣿⣿⣿⡇⢸⡻⣿⣿⣿⣿⣿⣿⣿ ",
	--                  "      .,;'           :,.      ⢹⡇⣿⣿⣿⠄⣞⣯⣷⣾⣿⣿⣧⡹⡆⡀⠉⢹⡌⠐⢿⣿⣿⣿⡞⣿⣿⣿ ",
	--                  "    .,;;;,,.         ccc;.    ⣾⡇⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣄⢻⣦⡀⠁⢸⡌⠻⣿⣿⣿⡽⣿⣿ ",
	--                  "  .;c::::,,,'        ccccc:   ⡇⣿⠹⣿⡇⡟⠛⣉⠁⠉⠉⠻⡿⣿⣿⣿⣿⣿⣦⣄⡉⠂⠈⠙⢿⣿⣝⣿ ",
	--                  "  .::cc::,,,,,.      cccccc.  ⠤⢿⡄⠹⣧⣷⣸⡇⠄⠄⠲⢰⣌⣾⣿⣿⣿⣿⣿⣿⣶⣤⣤⡀⠄⠈⠻⢮ ",
	--                  "  .cccccc;;;;;;'     llllll.    ⣧⠄⢘⢻⣿⡇⢀⣀⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠄⢀ ",
	--                  "  .cccccc.,;;;;;;.   llllll.    ⣿⡆⢸⣿⣿⣿⣬⣭⣴⣿⣿⣿⣿⣿⣿⣿⣯⠝⠛⠛⠙⢿⡿⠃⠄⢸ ",
	--                  "  .cccccc  ';;;;;;'  oooooo.    ⢿⣿⡀⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡾⠁⢠⡇⢀ ",
	--                  "  'lllllc   .;;;;;;;.oooooo'    ⢸⣿⡇⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣫⣻⡟⢀⠄⣿⣷⣾ ",
	--                  "  'lllllc     ,::::::looooo'    ⢸⣿⡇⠄⠈⠙⠿⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠊⢀⡇⣿⣿ ",
	--                  "  'llllll      .:::::lloddd'     ⣿⡇⢀⡲⠄⠄⠈⠙⠻⢿⣿⣿⠿⠿⠟⠛⠋⠁⣰⠇ ⢸⣿⣿⣿ ",
	--                  "  .looool       .;::coooodo.     ⣿⡇⢬⡻⡇⡄⠄⠄⠄⡰⢖⠔⠉⠄⠄⠄⠄⣼⠏  ⢸⣿⣿⣿ ",
	--                  "    .cool         'ccoooc.       ⣿⡇⠄⠙⢌⢷⣆⡀⡾⡣⠃⠄⠄⠄⠄⠄⣼⡟    ⢿⣿⣿ ",
	--                  "      .co          .:o:.        ⠀⣿⡇⡏⠀⠀⠙⣆⠀⠀⠀⠀⠀⠀⠀⢀⣠⢶⡇⠀⠀ ⠀⠀⢿⣿ ",
	--                  "        .           .'           ⠇⠀  ⠀⠀⡿⢣⣀⣀⣀⡤⠴⡞⠉⠀⢸⠀    ⠀⠀  ",
	-- }
end

return M

