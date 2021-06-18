local M = {}

function M.config()
	local wk = require ("which-key")

	wk.register({
		["<Space>"] = {
			name = "+File Exploler",
			f = { ":RnvimrToggle<CR>", " ﱮ Open ranger explorer" },
			t = { ":lua require('FTerm').close()<CR>", "  Terminal Close Float" },
			o = { ":lua require('FTerm').open()<CR>", "  Terminal Open Float" },
			i = { ":lua require('dap.ui.widgets').hover()<CR>", "  Debug Float" },
			c = { ":lua require('dap.ui.widgets').hover().close()<CR>", "  Debug Float Close" },
			d = { ":lua require'dap'.toggle_breakpoint()<CR>", "  Toggle Breakpoint" }
		}
	})
end

return M


