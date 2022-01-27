local M = {}

function M.config()

	local U = require "utils"

	vim.g.floaterm_keymap_toggle = "<F1>"
	vim.g.floaterm_keymap_kill = "<F2>"

	U.map ("","<F6>",":cd %:p:h<CR>:w <bar> :FloatermNew --height=0.7 --width=0.7 --wintype=floating --name=Application --autoclose=0 g++ -O2 -Wall % -o %:r && ./%:r<CR>")
	require("FTerm").setup({
		 dimensions  = {
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5
    },
    border = 'single' -- or 'double'
	})
	local map = vim.api.nvim_set_keymap
	local opts = { noremap = true, silent = true }
	local wk = require ("which-key")



end

return M
