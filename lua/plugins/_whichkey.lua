
local M = {}

function whichkeyJava()
		local wk = require("which-key")
		-- local java = require("build._java")

		wk.register({
			["<leader>j"] = {
				name = "+Java",
				f = { "<CMD>lua require('build._java').build()<CR>", "Build Spring" },
				n = { "<cmd>enew<cr>", "New File" },
		  			},
		})
end

function M.config()
	local g = vim.g
	 require("which-key").setup {
		
	}
	vim.cmd(([[
		autocmd FileType java lua whichkeyJava()
	]]))
end

return M

